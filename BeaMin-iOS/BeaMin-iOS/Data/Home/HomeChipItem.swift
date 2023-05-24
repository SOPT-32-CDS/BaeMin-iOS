//
//  HomeChipItem.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/22.
//

import UIKit

struct HomeChipItem {
    let chipImage : UIImage
    let chipTitle : String
    var chipTapped : Bool
}

extension HomeChipItem {
    
    static func homeChipMenuData() -> [HomeChipItem] {
        return [
            HomeChipItem(chipImage: UIImage.assetImage(.basicImage)!, chipTitle: "기본순", chipTapped: false),
            HomeChipItem(chipImage: UIImage.assetImage(.scrdownImage)!, chipTitle: "초기화", chipTapped: false),
            HomeChipItem(chipImage: UIImage.assetImage(.couponImage)!, chipTitle: "쿠폰", chipTapped: false),
            HomeChipItem(chipImage: UIImage.assetImage(.oneservingImage)!, chipTitle: "1인분", chipTapped: false),
            HomeChipItem(chipImage: UIImage.assetImage(.starImage)!, chipTitle: "배달팁", chipTapped: false)
        ]
    }
}
