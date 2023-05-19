//
//  HomePromotion.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/19.
//

import UIKit

enum HomePromotion {
    case promotion1
    case promotion2
    case promotion3
    case promotion4
    
    func homePromotion() -> String {
        switch self {
        case .promotion1 :
            return "배달팁\n낮은 가게"
        case .promotion2 :
            return "재주문율\n높아요"
        case .promotion3 :
            return "주문 전\n쿠폰 받기"
        case .promotion4 :
            return "찜 많은 가게"
        }
    }
}
