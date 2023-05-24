//
//  CartManager.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/23.
//

import UIKit

import Alamofire

import CustomExtension

final class CartManager {
    static let shared = CartManager()
    private init() {}
    
    let header: HTTPHeaders = [.authorization(bearerToken: Constant.CartNetworkConstant.bearer)]
    private func makeCartUrl(cartID: String = "") -> String {
        return Constant.CartNetworkConstant.baseURL+cartID
    }
    
    func fetchCartDTO(completion: @escaping (CartModelDTO) -> Void) {
        let dataRequest = AF.request(makeCartUrl(), method: .get, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, changeData: CartModel.self)
                switch networkResult {
                case .success(let data):
                    completion(self.convertCartDTO(input: data))
                case .serverErr:
                    fatalError("서버에러")
                case .networkErr:
                    fatalError("네트워크에러")
                }
            case .failure:
                fatalError("네트워킹실패")
            }
        }
    }
    
    private func convertCartDTO(input: CartModel) -> CartModelDTO {
        .init(cartID: input.data.cartID, menusByStore: input.data.cartStoreList.map{.init(storeImage: .menu6, storeName: $0.name, cartMenus: $0.cartItemList.map{.init(menuImage: .menu10, menuName: $0.name, sideInfo: $0.options, singleMenuPrice: $0.totalPrice/$0.count, totalPricePerMenu: $0.totalPrice, menuCount: $0.count)}, minimumPriceForDelivery: input.data.deliveryFee)})
    }

    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, changeData: T.Type) -> NetworkResult<T> {
        switch statusCode {
        case 200..<300: return isValidData(data: data, changeData: T.self)
        case 500..<600: return .serverErr
        default: return .networkErr
        }
    }

    private func isValidData<T: Codable>(data: Data, changeData: T.Type) -> NetworkResult<T> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else { fatalError("decode error") }
        return .success(decodedData)
    }
    
    
}

enum NetworkResult<T> {
    case success(T)     // 서버 통신 성공
    case serverErr  // 서버 내부 에러
    case networkErr // 네트워크 연결 실패
}
