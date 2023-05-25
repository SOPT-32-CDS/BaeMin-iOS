//
//  Store.swift
//  BeaMin-iOS
//
//  Created by 남유진 on 2023/05/25.
//

import Foundation

// MARK: - Store
struct Store: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let name: String
    let image: String
    let rate: Double
    let minOrderAmount, deliveryFee, minDeliveryTime, maxDeliveryTime: Int
    let coupon: String
    let menuCategories: [MenuCategory]

    enum CodingKeys: String, CodingKey {
        case id, name, image, rate
        case minOrderAmount = "min_order_amount"
        case deliveryFee = "delivery_fee"
        case minDeliveryTime = "min_delivery_time"
        case maxDeliveryTime = "max_delivery_time"
        case coupon
        case menuCategories = "menu_categories"
    }
}

// MARK: - MenuCategory
struct MenuCategory: Codable {
    let id: Int
    let name: String
    let menus: [MenuDetail]
}

// MARK: - MenuDetail
struct MenuDetail: Codable {
    let id: Int
    let name, description: String
    let image: String
    let basePrice: Int

    enum CodingKeys: String, CodingKey {
        case id, name, description, image
        case basePrice = "base_price"
    }
}
