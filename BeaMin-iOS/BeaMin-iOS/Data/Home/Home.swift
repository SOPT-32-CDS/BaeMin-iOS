//
//  Home.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/15.
//

import Foundation

//// MARK: - Home
//struct Home: Codable {
//    let status: Int
//    let message: String
//    let data: [HomeStore]
//}

// MARK: - Datum
struct HomeStore {
    let id: Int
    let name: String
    let image: String
    let rate: Double
    let minOrderAmount, deliveryFee, minDeliveryTime, maxDeliveryTime: Int
    let hasCoupon: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, rate
        case minOrderAmount = "min_order_amount"
        case deliveryFee = "delivery_fee"
        case minDeliveryTime = "min_delivery_time"
        case maxDeliveryTime = "max_delivery_time"
        case hasCoupon = "has_coupon"
    }
}

extension HomeStore { 
    static func dummyHomeStore() -> [HomeStore] {
        return [
            HomeStore(id: 1,
                      name: "정담초밥",
                      image: "https://i.ibb.co/mJhK4mw/store.png",
                      rate: 4.7,
                      minOrderAmount: 15000,
                      deliveryFee: 4400,
                      minDeliveryTime: 22,
                      maxDeliveryTime: 38,
                      hasCoupon: "coupon"),
            HomeStore(id: 2,
                      name: "정담초밥",
                      image: "https://i.ibb.co/mJhK4mw/store.png",
                      rate: 4.7,
                      minOrderAmount: 15000,
                      deliveryFee: 4400,
                      minDeliveryTime: 22,
                      maxDeliveryTime: 38,
                      hasCoupon: "direct-coupon"),
            HomeStore(id: 3,
                      name: "정담초밥",
                      image: "https://i.ibb.co/mJhK4mw/store.png",
                      rate: 4.7,
                      minOrderAmount: 15000,
                      deliveryFee: 4400,
                      minDeliveryTime: 22,
                      maxDeliveryTime: 38,
                      hasCoupon: "")
        ]
    }
}
