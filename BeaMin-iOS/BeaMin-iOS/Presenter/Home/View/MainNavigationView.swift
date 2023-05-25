//
//  MainNavigationView.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/25.
//  Copyright (c) 2023 MainNavigation. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class MainNavigationView: UIView {
    
    private let titleLabel = UILabel()
    private let homeButton = UIButton()
    private let cartButton = UIButton()
    private let addressTitle = UILabel()
    private let addressText = UILabel()
    private let downButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
        // MARK: - button의 addtarget설정
        setAddTarget()
        
        // MARK: - delegate설정
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension MainNavigationView {
    func setUI() {
        backgroundColor = .designSystem(.white)
        
        titleLabel.do {
            $0.text = "배민"
            $0.font = .hannaPro(.brandTypeBig)
            $0.textColor = .designSystem(.black)
        }
        
        homeButton.do {
            $0.setImage(.assetImage(.homeButton), for: .normal)
        }
        
        cartButton.do {
            $0.setImage(.assetImage(.cartImage), for: .normal)
        }
        
        addressTitle.do {
            $0.text = "우리집"
            $0.font = .pretendard(.body2Bold)
        }
        
        addressText.do {
            $0.text = "송파구 올림픽로 135"
            $0.font = .pretendard(.body2)
        }
        
        downButton.do {
            $0.setImage(.assetImage(.scrdownImage), for: .normal)
        }
    }
    
    func setHierarchy() {
        addSubviews(titleLabel, homeButton, cartButton, addressTitle, addressText, downButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaInsets).inset(50)
            $0.leading.equalToSuperview().inset(17)
        }
        
        homeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(52)
            $0.trailing.equalToSuperview().inset(50)
            $0.width.height.equalTo(28)
        }
        
        cartButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(51)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(28)
        }
        
        addressTitle.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(16) 
        }
        
        addressText.snp.makeConstraints {
            $0.top.equalTo(addressTitle.snp.top)
            $0.leading.equalTo(addressTitle.snp.trailing).offset(3)
        }
        
        downButton.snp.makeConstraints {
            $0.top.equalTo(addressTitle.snp.top).offset(-2)
            $0.leading.equalTo(addressText.snp.trailing).offset(2)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
