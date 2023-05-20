//
//  HomePromotionItem.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/19.
//

import UIKit

struct HomePromotionItem {
    let title : String
}

extension HomePromotionItem {
    
    static func homePromotionDummyData() -> [HomePromotionItem] {
        return [
            HomePromotionItem(title : "배달팁\n낮은 가게"),
            HomePromotionItem(title : "재주문율\n높아요"),
            HomePromotionItem(title : "주문 전\n쿠폰 받기"),
            HomePromotionItem(title : "찜 많은 가게")
        ]
    }
}
