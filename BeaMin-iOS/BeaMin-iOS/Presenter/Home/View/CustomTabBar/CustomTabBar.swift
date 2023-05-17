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
                let buttonText = UILabel()
                button.setImage(item.tabBarImage, for: .normal)
                buttonText.text = item.tabBarText
                stackView.addArrangedSubview(buttonText)
            }
    }
    
    private func setLayout() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview()
        }
        
//        NSLayoutConstraint.activate([
//            stackView.leftAnchor.constraint(equalTo: leftAnchor),
//            stackView.rightAnchor.constraint(equalTo: rightAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            stackView.topAnchor.constraint(equalTo: topAnchor),
//        ])
        
    }
}
