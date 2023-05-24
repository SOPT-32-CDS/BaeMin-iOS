//
//  CartModel.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/24.
//

import Foundation

// MARK: - Welcome
struct CartModel: Codable {
    let status: Int
    let message: String
    let data: DataClass
    
    // MARK: - DataClass
    struct DataClass: Codable {
        let cartID, totalPrice, deliveryFee: Int
        let cartStoreList: [CartStoreList]

        enum CodingKeys: String, CodingKey {
            case cartID = "cart_id"
            case totalPrice = "total_price"
            case deliveryFee = "delivery_fee"
            case cartStoreList = "cart_store_list"
        }
    }

    // MARK: - CartStoreList
    struct CartStoreList: Codable {
        let cartStoreID: Int
        let name: String
        let image: String
        let cartItemList: [CartItemList]

        enum CodingKeys: String, CodingKey {
            case cartStoreID = "cart_store_id"
            case name, image
            case cartItemList = "cart_item_list"
        }
    }

    // MARK: - CartItemList
    struct CartItemList: Codable {
        let cartItemID: Int
        let name: String
        let totalPrice: Int
        let options: String
        let count: Int

        enum CodingKeys: String, CodingKey {
            case cartItemID = "cart_item_id"
            case name
            case totalPrice = "total_price"
            case options, count
        }
    }

}

