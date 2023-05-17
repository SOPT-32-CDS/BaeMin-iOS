//
//  StoreDetail.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/16.
//

import Foundation

struct StoreDetail {
    /// header
    let storeName: String
    let storeStars: Float
    let storeReviews: Int
    let mimPrice: String
    let deliverTime: String
    let deliverTips: String

    let menuOrder: [MenuOrderInfo]

    struct MenuOrderInfo {
        let menuName: String
        let menuDetail: [Menu]
    }

    struct Menu {
        let menuName: String
        let menuContent: String
        let menuPrice: String
    }
}
