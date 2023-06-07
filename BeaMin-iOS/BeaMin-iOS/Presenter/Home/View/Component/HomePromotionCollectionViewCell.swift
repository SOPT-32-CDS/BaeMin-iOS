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
    
    private let promotionButton = UIButton()
    
    private let promotionView = UIView()
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

extension HomePromotionCollectionViewCell {
    func setUI() {
        
        promotionView.do{
            $0.backgroundColor = .designSystem(.darkGreen)
            $0.layer.cornerRadius = 8
        }
        
        promotionLabel.do {
            $0.text = "텍스트"
            $0.numberOfLines = 2
            $0.font = .pretendard(.h3Headline)
            $0.textColor = .designSystem(.white)
        }
    }
    
    func setHierarchy() {
        addSubviews(promotionView, promotionLabel)
    }
    
    func setLayout() {
        
        promotionView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(74)
        }
        
        promotionLabel.snp.makeConstraints {
            $0.top.equalTo(promotionView.snp.top).offset(7)
            $0.leading.equalTo(promotionView.snp.leading).offset(9)
        }

    }
    
    func setDataBind(model : HomePromotionItem) {
        promotionLabel.text = model.title
    }
    
}
