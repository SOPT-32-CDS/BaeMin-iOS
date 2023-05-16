//
//  OrderDetail.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/15.
//

import Foundation

struct OrderDetail {
    /// header
    let menuImage: String
    let menuName: String
    let menuDetail: String
    let menuPrice: Int
    
    /// footer
    let menuAmount: Int
    let minPriceForDelivery: Int
    
    let addOrder: [AddOrderInfo]
    
    struct AddOrderInfo {
        let addMenuName: String
        let addMenu: [Menu]
    }
    
    struct Menu {
        var isChecked: Bool = false
        let addMenuName: String
        let addMenuPrice: Int
    }
}
