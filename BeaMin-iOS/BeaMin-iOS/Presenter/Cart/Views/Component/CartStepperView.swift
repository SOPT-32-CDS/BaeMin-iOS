//
//  CartStepperView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem


final class CartStepperView: UIView {
    
    weak var delegate: menuCountDelegate?
    
    private var menuCount: Int = 1 {
        didSet {
            menuCountLabel.text = menuCount.description
            self.delegate?.priceChangeByMenuCount(menuCont: menuCount)
        }
    }
    
    private let appendButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.mini_plus), for: .normal)
        return button
    }()
    
    private let reduceButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.mini_minus), for: .normal)
        return button
    }()
    
    private lazy var menuCountLabel: UILabel = {
        let label = UILabel()
        label.text = menuCount.description
        label.font = .pretendard(.body3)
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

private extension CartStepperView {
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
            make.leading.equalToSuperview().inset(7)
            make.size.equalTo(22)
        }
        
        menuCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(appendButton.snp.trailing).offset(15)
        }
        
        reduceButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(7)
            make.leading.equalTo(menuCountLabel.snp.trailing).offset(16)
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

