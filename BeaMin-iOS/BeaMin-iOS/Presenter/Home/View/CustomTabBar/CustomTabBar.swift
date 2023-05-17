//
//  CustomTabBar.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/16.
//

import UIKit

import Then
import SnapKit

final class CustomTabBar: UIView {
    
    private let stackView = UIStackView()
    private let eachStackView = UIStackView()
    private let tabBarItems: [TabBarItem]
    
    init(tabBarItems: [TabBarItem]) {
        self.tabBarItems = tabBarItems
        super.init(frame: .zero)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setStyle() {
        backgroundColor = .designSystem(.white)
        
        tabBarItems
            .enumerated()
            .forEach { i, item in
                let button = UIButton()
                button.setImage(item.tabBarImage, for: .normal)
                button.setTitle(item.tabBarText, for: .normal)
                button.setTitleColor(.designSystem(.gray1), for: .normal)
                button.titleLabel?.font = .pretendard(.body4Bold)
                button.adjustsImageWhenHighlighted = false
                button.alignTextBelow(spacing: 1)
                stackView.spacing = 33
                stackView.addArrangedSubview(button)
            }
    }
    
    private func setLayout() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-5)
            $0.leading.equalToSuperview().inset(35)
            $0.trailing.equalToSuperview().inset(25)
        }
        
    }
}
