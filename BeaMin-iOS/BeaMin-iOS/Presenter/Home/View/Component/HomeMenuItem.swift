//
//  HomeMenuItem.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/19.
//

import UIKit

struct HomeMenuItem {
    let homeMenuImage : UIImage
    let homeMenuText : String
}

extension HomeMenuItem {
    
    static func homeMenuDummyData() -> [HomeMenuItem] {
        return [
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu24)!, homeMenuText : "1인분"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu23)!, homeMenuText : "족발,보쌈"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu22)!, homeMenuText : "찜,탕,찌개"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu21)!, homeMenuText : "돈까스,회,일식"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu20)!, homeMenuText : "피자"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu19)!, homeMenuText : "고기,구이"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu18)!, homeMenuText : "야식"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu17)!, homeMenuText : "양식"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu16)!, homeMenuText : "치킨"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu15)!, homeMenuText : "중식"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu14)!, homeMenuText : "아시안"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu13)!, homeMenuText : "백반,죽,국수"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu12)!, homeMenuText : "도시락"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu11)!, homeMenuText : "분식"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu10)!, homeMenuText : "카페,디저트"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu9)!, homeMenuText : "패스트푸드"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu8)!, homeMenuText : "채식"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu7)!, homeMenuText : "브랜드관"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu6)!, homeMenuText : "맛집랭킹"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu5)!, homeMenuText : "게임기"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu4)!, homeMenuText : "편의점"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu3)!, homeMenuText : "꽃"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu2)!, homeMenuText : "반찬"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu1)!, homeMenuText : "반려용품"),
            HomeMenuItem(homeMenuImage :UIImage.assetImage(.menu)!, homeMenuText : "건강식품")
        ]
    }
}


