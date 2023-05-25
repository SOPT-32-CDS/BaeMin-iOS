//
//  CartModelDTO.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//

import Foundation

import DesignSystem
import CustomExtension

struct CartModelDTO {
    
    struct MenuByStore {
        let storeID: Int
        let storeImage: Constant.ImageName
        let storeName: String
        var cartMenus: [CartMenu]
    }

    struct CartMenu {
        let menuID: Int
        let menuImage: Constant.ImageName
        let menuName: String
        let sideInfo: String?
        var singleMenuPrice: Int
        var totalPricePerMenu: Int
        var menuCount: Int
    }
    var cartID: Int
    var totalDeliveryTip: Int
    var menusByStore: [MenuByStore]
    
    var totalPrice: Int {
        return menusByStore.map{ $0.cartMenus }.flatMap{ $0 }.map{ $0.totalPricePerMenu }.reduce(0, +)
    }
    
    var totalMenuCount: Int {
        return menusByStore.map{ $0.cartMenus }.flatMap{ $0 }.map{ $0.menuCount }.reduce(0, +)
    }
}





extension CartModelDTO {
    static var cartDummy: CartModelDTO {
        return
            .init(cartID: 1, totalDeliveryTip: 8800, menusByStore: [
                .init(storeID: 1,
                      storeImage: .logoImage,
                      storeName: "청담초밥 송파점",
                      cartMenus: sushiMenus),
                .init(storeID: 2,
                      storeImage: .logoImage,
                      storeName: "황후 탕후루",
                      cartMenus: tanghuruMenus)
            ])
        
    }
    
    static var sushiMenus: [CartMenu] {
        return [
            .init(menuID: 1,
                  menuImage: .suish,
                  menuName: "[갓성비]모둠초밥(10P)+미니우동",
                  sideInfo: "새우튀김(6p)추가(7,000원)",
                  singleMenuPrice: 11000,
                  totalPricePerMenu: 36000,
                  menuCount: 2),
            .init(menuID: 2,
                  menuImage: .suish2,
                  menuName: "[재주문1위]특초밥+미니우동",
                  sideInfo: nil,
                  singleMenuPrice: 12000,
                  totalPricePerMenu: 16000,
                  menuCount: 1)
        ]
    }
    
    static var tanghuruMenus: [CartMenu] {
        return [
            .init(menuID: 1,
                  menuImage: .tang,
                  menuName: "딸기탕후루 제철이 끝나가는중",
                  sideInfo: nil,
                  singleMenuPrice: 3800,
                  totalPricePerMenu: 26600,
                  menuCount: 7)
        ]
    }
}
