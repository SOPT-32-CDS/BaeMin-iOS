//
//  Constant.swift
//  CustomExtension
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

public struct Constant {
    public struct Screen {
        public static let width = UIScreen.main.bounds.width
        public static let height = UIScreen.main.bounds.height
    }
    
    public enum ImageName: String {
        
        /// 상단바 이미지
        case backButton = "ic_back"
        case homeButton = "ic_home"
        case shareImage = "ic_share"
        case cartImage = "ic_shopping"
        case cartputImage = "ic_cart_put"
        case addpersonImage = "ic_person_plus"
        
        /// 하단바 이미지
        case nav_heart = "ic_nav_heart"
        case nav_my = "ic_nav_my"
        case nav_order = "ic_nav_order"
        case nav_search = "ic_nav_search"
        case logoImage = "ic_logo"
        
        /// chips 이미지
        case oneservingImage = "ic_chips_1p"
        case basicImage = "ic_chips_basic"
        case couponImage = "ic_chips_coupon"
        case starImage = "ic_chips_ratescore"
        case scrdownImage = "ic_chips_scrdown"
        
        /// 주문하기상세메인 이미지
        case heart_3 = "ic_heart_3"
        case share_3 = "ic_share_3"
        case together_3 = "ic_together_3"
        case oneshipping = "ic_shipping_1p"
        case popularityMark = "popularityMark"
        
        /// 홈 메뉴 이미지
        case menu = "Mask group"
        case menu1 = "Mask group-1"
        case menu2 = "Mask group-2"
        case menu3 = "Mask group-3"
        case menu4 = "Mask group-4"
        case menu5 = "Mask group-5"
        case menu6 = "Mask group-6"
        case menu7 = "Mask group-7"
        case menu8 = "Mask group-8"
        case menu9 = "Mask group-9"
        case menu10 = "Mask group-10"
        case menu11 = "Mask group-11"
        case menu12 = "Mask group-12"
        case menu13 = "Mask group-13"
        case menu14 = "Mask group-14"
        case menu15 = "Mask group-15"
        case menu16 = "Mask group-16"
        case menu17 = "Mask group-17"
        case menu18 = "Mask group-18"
        case menu19 = "Mask group-19"
        case menu20 = "Mask group-20"
        case menu21 = "Mask group-21"
        case menu22 = "Mask group-22"
        case menu23 = "Mask group-23"
        case menu24 = "Mask group-24"
        case ic_star = "ic_star"
        
        /// OrderDetail Image
        case menuImage = "MenuImage"
        case fillCheckBox = "checkBoxTrue"
        case emptyCheckBox = "checkBoxFalse"
        
        case minus
        case plus
        
        var real: String {
            return self.rawValue
        }
    }
}

extension UIImage {
    public static func assetImage(_ name: Constant.ImageName) -> UIImage? {
        return UIImage(named: name.real)
    }
}
