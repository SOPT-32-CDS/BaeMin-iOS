//
//  PopularMenuSectionHeaderView.swift
//  BeaMin-iOS
//
//  Created by 남유진 on 2023/05/23.
//  Copyright (c) 2023 PopularMenuSectionHeader. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class PopularMenuSectionHeaderView: UIView {
    
    private let menuTitle = UILabel().then {
        $0.font = .pretendard(.h1Headline)
        $0.textColor = .designSystem(.black)
    }
    
    private let arrowButton = UIButton().then {
        $0.setImage(.assetImage(.uparrow), for: .normal)
    }
    
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
    
    func config(title: String) {
        self.menuTitle.text = title
    }
    
}

private extension PopularMenuSectionHeaderView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubviews(menuTitle, arrowButton)
    }
    
    func setLayout() {
        menuTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(20)
        }
        
        arrowButton.snp.makeConstraints {
            $0.width.equalTo(8)
            $0.height.equalTo(4)
            $0.top.equalToSuperview().offset(31)
            $0.trailing.equalToSuperview().inset(32)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
