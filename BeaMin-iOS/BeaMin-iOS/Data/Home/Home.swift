//
//  Home.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/15.
//

import Foundation

// MARK: - Home
struct Home: Decodable {
    let status: Int
    let message: String
    let data: [HomeStore]
}

// MARK: - Datum
struct HomeStore : Decodable{
    let id: Int
    let name: String
    let image: String
    let rate: Double
    let minOrderAmount, deliveryFee, minDeliveryTime, maxDeliveryTime: Int
    let coupon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, rate
        case minOrderAmount = "min_order_amount"
        case deliveryFee = "delivery_fee"
        case minDeliveryTime = "min_delivery_time"
        case maxDeliveryTime = "max_delivery_time"
        case coupon
    }
}

struct HomeDTO {
    let id: Int
    let name: String
    let image: String
    let rate: Double
    let minOrderAmount: Int
    let deliveryFee: Int
    let minDeliveryTime: Int
    let maxDeliveryTime: Int
    let coupon: String?
}

extension Home {
    func convertHomeDTO() -> [HomeDTO] {
        return data.map { HomeDTO(id: $0.id, name: $0.name, image: $0.image, rate: $0.rate, minOrderAmount: $0.minOrderAmount, deliveryFee: $0.deliveryFee, minDeliveryTime: $0.minDeliveryTime, maxDeliveryTime: $0.maxDeliveryTime, coupon: $0.coupon) }
    }
}
