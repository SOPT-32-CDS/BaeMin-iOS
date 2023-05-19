//
//  HomePromotionCollectionViewCell.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/18.
//  Copyright (c) 2023 HomePromotion. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomePromotionCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    // MARK: - CollectionViewCellReuseProtocol을 채택하면 identifier안만들어도 됩니다
//    static let identifier = "HomePromotionCollectionViewCell"
    
    private let promotionButton = UIButton()
    private let promotionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomePromotionCollectionViewCell {
    func setUI() {
        backgroundColor = .blue
        promotionButton.do {
            $0.backgroundColor = .designSystem(.darkGreen)
            $0.titleLabel?.text = promotionLabel.text
        }
        
        promotionLabel.do {
            $0.font = .pretendard(.h3Headline)
            $0.textColor = .designSystem(.white)
            $0.textAlignment = .left
            $0.text = "으아아"
        }
    }
    
    func setHierarchy() {
        addSubview(promotionButton)
    }
    
    func setLayout() {
        promotionButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(74)
        }

    }
    
}
