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
        let storeImage: String
        let storeName: String
        var cartMenus: [CartMenu]
    }
    
    struct CartMenu {
        let menuID: Int
        let menuImage: String
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
