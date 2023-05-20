//
//  HomePromotion.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/19.
//

import UIKit

struct HomePromotion {
    let title : String
}

extension HomePromotion {
    
    func homePromotion() -> [HomePromotion] {
        return [
            HomePromotion(title : "배달팁\n낮은 가게"),
            HomePromotion(title : "재주문율\n높아요"),
            HomePromotion(title : "주문 전\n쿠폰 받기"),
            HomePromotion(title : "찜 많은 가게")
        ]
    }
}
