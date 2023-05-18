//
//  CustomTabBarItem.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/18.
//

import UIKit

enum CustomTabBarItem: Int {
    case find
    case heart
    case logo
    case order
    case mypage
    
    var tabBarImage: UIImage? {
        switch self {
        case .find :
            return UIImage.assetImage(.nav_search)
        case .heart :
            return UIImage.assetImage(.nav_heart)
        case .logo :
            return UIImage.assetImage(.logoImage)
        case .order :
            return UIImage.assetImage(.nav_order)
        case .mypage :
            return UIImage.assetImage(.nav_my)
        }
    }
    
    var tabBarText: String {
        switch self {
        case .find :
            return "검색"
        case .heart :
            return "찜"
        case .logo :
            return "\n"
        case .order :
            return "주문내역"
        case .mypage :
            return "my배민"
        }
    }
}

