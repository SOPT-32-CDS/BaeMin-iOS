//
//  MenuStepperView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/17.
//  Copyright (c) 2023 MenuStepper. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

protocol menuCountDelegate: AnyObject {
    func priceChangeByMenuCount(menuCont: Int)
}

final class MenuStepperView: UIView {
    
    weak var delegate: menuCountDelegate?
    
    private var menuCount: Int = 1 {
        didSet {
            menuCountLabel.text = menuCount.description + "개"
            self.delegate?.priceChangeByMenuCount(menuCont: menuCount)
        }
    }
    
    private let appendButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.plus), for: .normal)
        return button
    }()
    
    private let reduceButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.minus), for: .normal)
        return button
    }()
    
    private lazy var menuCountLabel: UILabel = {
        let label = UILabel()
        label.text = menuCount.description + "개"
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        return label
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

}

private extension MenuStepperView {
    func setUI() {
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = .designSystem(.gray2)
    }
    
    func setHierarchy() {
        addSubviews(appendButton, menuCountLabel, reduceButton)
    }
    
    func setLayout() {
        appendButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.size.equalTo(28)
        }
        
        menuCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(appendButton.snp.trailing).offset(28)
        }
        
        reduceButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(menuCountLabel.snp.trailing).offset(28)
        }
    }
    
    func setAddTarget() {
        appendButton.addButtonAction { sender in
            self.menuCount += 1
        }
        reduceButton.addButtonAction { sender in
            if self.menuCount >= 2 {
                self.menuCount -= 1
            }
        }
    }
}
