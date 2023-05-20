//
//  HomeMenuCollectionViewCell.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/19.
//  Copyright (c) 2023 HomeMenu. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeMenuCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private let homeMenuImage = UIImageView()
    private let homeMenuTitle = UILabel()
    
    override init(frame : CGRect) {
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

extension HomeMenuCollectionViewCell {
    func setUI() {
        
        homeMenuImage.do {
            $0.image = UIImage.assetImage(.menu11)
        }
        
        homeMenuTitle.do {
            $0.text = "텍스트"
            $0.textAlignment = .center
            $0.font = .hannaPro(.brandTypeMiddle)
            $0.textColor = .designSystem(.black)
        }
    }
    
    func setHierarchy() {
        addSubviews(homeMenuImage, homeMenuTitle)
    }
    
    func setLayout() {
        
        homeMenuImage.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.top.equalToSuperview().inset(4)
            $0.leading.trailing.equalToSuperview().inset(4)
        }
        
        homeMenuTitle.snp.makeConstraints {
            $0.top.equalTo(homeMenuImage.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setDataBind(model: HomeMenuItem) {
        homeMenuImage.image = model.homeMenuImage
        homeMenuTitle.text = model.homeMenuText
    }
}
