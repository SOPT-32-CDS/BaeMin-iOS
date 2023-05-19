//
//  BMNavigationBar.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/17.
//  Copyright (c) 2023 BMNavigationBar. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

protocol navigationDelegate: AnyObject {
    func backButtonTapped()
    func homeButtonTapped()
    func shareButtonTapped()
    func goCartButtonTapped()
    
}

final class BMNavigationBar: UIView {
    
    var buttonTintColor: UIColor? {
        didSet {
            backButton.tintColor = buttonTintColor
            homeButton.tintColor = buttonTintColor
            shareButton.tintColor = buttonTintColor
            goCartButton.tintColor = buttonTintColor
        }
    }
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.backButton)?.withRenderingMode(.alwaysTemplate) , for: .normal)
        button.tintColor = .designSystem(.white)
        return button
    }()
    
    var menuName: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.bady2)
        label.textColor = .designSystem(.black)
        label.isHidden = true
        return label
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.homeButton)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .designSystem(.white)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.shareImage)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .designSystem(.white)
        return button
    }()
    
    private let goCartButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.cartImage)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .designSystem(.white)
        return button
    }()
    
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
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(menuName: String) {
        self.menuName.text = menuName
    }

}

private extension BMNavigationBar {
    func setUI() {
    }
    
    func setHierarchy() {
        addSubviews(backButton, menuName, homeButton, shareButton, goCartButton)
    }
    
    func setLayout() {
        
        self.snp.makeConstraints { make in
            make.height.equalTo(97)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.leading.equalToSuperview().inset(8)
            make.size.equalTo(28)
        }
        
        menuName.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(13)
            make.trailing.equalTo(homeButton.snp.leading).offset(-13)
        }
        
        goCartButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.trailing.equalToSuperview().inset(8)
            make.size.equalTo(28)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.trailing.equalTo(goCartButton.snp.leading).offset(-14)
            make.size.equalTo(28)
        }
        
        homeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.trailing.equalTo(shareButton.snp.leading).offset(-14)
            make.size.equalTo(28)
        }
    }
    
    func setAddTarget() {
        
    }
}
