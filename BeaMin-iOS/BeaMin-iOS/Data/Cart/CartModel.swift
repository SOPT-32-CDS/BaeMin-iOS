//
//  CartModel.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//

import Foundation

import DesignSystem
import CustomExtension

struct CartModel {
    let menusByStore: [MenuByStore]
}

struct MenuByStore {
    let storeImage: Constant.ImageName
    let storeName: String
    let cartMenus: [CartMenu]
    let minimumPriceForDelivery: Int
}

struct CartMenu {
    let menuImage: Constant.ImageName
    let menuName: String
    let sideInfo: String?
    let singleMenuPrice: Int
    let totalPricePerMenu: Int
    let menuCount: Int
}



extension CartModel {
    static var cartDummy: CartModel {
        return
            .init(menusByStore: [
                .init(storeImage: .logoImage,
                      storeName: "청담초밥 송파점",
                      cartMenus: sushiMenus,
                      minimumPriceForDelivery: 2000),
                .init(storeImage: .logoImage,
                      storeName: "황후 탕후루",
                      cartMenus: tanghuruMenus,
                      minimumPriceForDelivery: 3000)
            ])
        
    }
    
    static var sushiMenus: [CartMenu] {
        return [
            .init(menuImage: .suish,
                  menuName: "[갓성비]모둠초밥(10P)+미니우동",
                  sideInfo: "새우튀김(6p)추가(7,000원)",
                  singleMenuPrice: 11000,
                  totalPricePerMenu: 36000,
                  menuCount: 2),
            .init(menuImage: .suish2,
                  menuName: "[재주문1위]특초밥+미니우동",
                  sideInfo: nil,
                  singleMenuPrice: 12000,
                  totalPricePerMenu: 16000,
                  menuCount: 1)
        ]
    }
    
    static var tanghuruMenus: [CartMenu] {
        return [
            .init(menuImage: .tang,
                  menuName: "딸기탕후루 제철이 끝나가는중",
                  sideInfo: nil,
                  singleMenuPrice: 3800,
                  totalPricePerMenu: 26600,
                  menuCount: 7)
        ]
    }
}
