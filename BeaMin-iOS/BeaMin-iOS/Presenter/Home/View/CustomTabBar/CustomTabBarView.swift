//
//  CustomTabBarView.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/18.
//  Copyright (c) 2023 CustomTabBar. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CustomTabBarView: UIView {
    
    private let stackView = UIStackView()
    private let tabBarItems: [CustomTabBarItem]
    
    init(tabBarItems: [CustomTabBarItem]) {
        self.tabBarItems = tabBarItems
        super.init(frame: .zero)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CustomTabBarView {
    func setUI() {
        backgroundColor = .designSystem(.white)
        
        tabBarItems
            .enumerated()
            .forEach { i, item in
                let button = UIButton()
                button.setImage(item.tabBarImage, for: .normal)
                button.setTitle(item.tabBarText, for: .normal)
                button.setTitleColor(.designSystem(.gray1), for: .normal)
                button.titleLabel?.font = .pretendard(.body4Bold)
                button.alignTextBelow(spacing: 1)
                button.snp.makeConstraints {
                    $0.width.equalTo(77)
                    $0.height.equalTo(49)
                }
                stackView.spacing = 8
                stackView.addArrangedSubview(button)
            }
    }
    
    func setHierarchy() {
        addSubview(stackView)
    }
    
    func setLayout() {    
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.centerX.equalToSuperview()
        }
    }
}
