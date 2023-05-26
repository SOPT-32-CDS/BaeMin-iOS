//
//  OrderDetailManager.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

import Alamofire

import CustomExtension

final class OrderDetailManager {
    static let shared = OrderDetailManager()
    private init() {}
    
    func appendMenuInCart(cartID: Int, storeID: Int = 1, menuName: String, menuImage: String, totalPrice: Int, options: String, totalCount: Int, completion: @escaping (Bool)->Void) {
        let dataRequest = AF.request(Constant.CartNetworkConstant.baseURL, method: .post, parameters: makeRequestBody(cartID: cartID, menuName: menuName, menuImage: menuImage, totalPrice: totalPrice, options: options, totalCount: totalCount), encoding: JSONEncoding.default)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                if 200..<300 ~= statusCode {
                    print("✅✅✅✅✅장바구니에메뉴추가API호출성공✅✅✅✅✅")
                    completion(true)
                }
            case .failure:
                fatalError("네트워킹실패")
            }
        }
    }
    
    private func makeRequestBody(cartID: Int, storeID: Int = 1, menuName: String, menuImage: String, totalPrice: Int, options: String, totalCount: Int) -> [String: Any] {
        return ["cart_id": cartID, "store_id": storeID, "name": menuName, "image": menuImage, "total_price": totalPrice, "options": options, "count": totalCount]
    }
}
