//
//  OrderMainManager.swift
//  BeaMin-iOS
//
//  Created by 남유진 on 2023/05/25.
//

import UIKit

import Alamofire

import CustomExtension

final class OrderMainManager {
    static let shared = OrderMainManager()
        private init() {}

        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        private func makeOrderMainUrl(storeID: String = "") -> String {
            return Constant.OrderMainNetworkConstant.baseURL+storeID
        }
}
