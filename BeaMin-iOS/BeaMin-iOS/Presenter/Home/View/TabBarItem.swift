//
//  TabBarItem.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/15.
//

import UIKit

enum TabBarItem: Int {
    case find
    case heart
    case order
    case mypage

    var tabBarImage: UIImage? {
        switch self {
        case .find :
            return UIImage.assetImage(.nav_search)
        case .heart :
            return UIImage.assetImage(.nav_heart)
        case .order :
            return UIImage.assetImage(.nav_order)
        case .mypage :
            return UIImage.assetImage(.nav_my)
        }
    }
}

