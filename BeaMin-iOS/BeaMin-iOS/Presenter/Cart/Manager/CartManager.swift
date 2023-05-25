//
//  CartManager.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/25.
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
                    print("✅✅✅✅✅Cart정보조회API호출성공✅✅✅✅✅")
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
    
    func deleteCartMenu(menuID: Int) {
        let dataRequest = AF.request(makeCartUrl(cartID: menuID.description), method: .delete, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                if 200..<300 ~= statusCode {
                    print("✅✅✅✅✅Cart삭제API호출성공✅✅✅✅✅")
                }
            case .failure:
                fatalError("네트워킹실패")
            }
        }
    }
    
    func orderComplete(cartID: Int, completion: @escaping (Bool)->Void) {
        let dataRequest = AF.request(makeCartUrl(cartID: cartID.description), method: .post, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                if 200..<300 ~= statusCode {
                    print("✅✅✅✅✅주문완료API호출성공✅✅✅✅✅")
                    completion(true)
                }
            case .failure:
                fatalError("네트워킹실패")
            }
        }
    }
    
}

private extension CartManager {
    func convertCartDTO(input: CartModel) -> CartModelDTO {
        .init(cartID: input.data.cartID,
              totalDeliveryTip: input.data.deliveryFee,
              menusByStore: input.data.cartStoreList.map{.init(storeID: $0.cartStoreID,
                                                               storeImage: .menu6,
                                                               storeName: $0.name,
                                                               cartMenus: $0.cartItemList.map{.init(menuID: $0.cartItemID,
                                                                                                    menuImage: .menu10,
                                                                                                    menuName: $0.name,
                                                                                                    sideInfo: $0.options,
                                                                                                    singleMenuPrice: $0.totalPrice/$0.count,
                                                                                                    totalPricePerMenu: $0.totalPrice,
                                                                                                    menuCount: $0.count)})})
    }

    func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, changeData: T.Type) -> NetworkResult<T> {
        switch statusCode {
        case 200..<300: return isValidData(data: data, changeData: T.self)
        case 500..<600: return .serverErr
        default: return .networkErr
        }
    }

    func isValidData<T: Codable>(data: Data, changeData: T.Type) -> NetworkResult<T> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else { fatalError("decode error") }
        return .success(decodedData)
    }
}
