//
//  CartInfoButton.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/19.
//  Copyright (c) 2023 CartInfoButton. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CartInfoButton: UIButton {
    
    var totalCount: Int {
        didSet {
            menuCountLabel.text = totalCount.description
        }
    }
    
    var totalPrice: Int {
        didSet {
            totalPriceLabel.text = totalPrice.makePriceLabelFromNumber()
        }
    }
    
    var changePrice: Int? {
        didSet {
            guard let changePrice else { return }
            totalPrice += changePrice
        }
    }
    
    private let menuCountLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body2Bold)
        label.textColor = .designSystem(.mainGreen)
        label.backgroundColor = .designSystem(.white)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 12
        return label
    }()
    
    private let buttonTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h1Headline)
        label.textColor = .designSystem(.white)
        label.text = "배달 주문하기"
        return label
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body2Bold)
        label.textColor = .designSystem(.white)
        return label
    }()
    
    init(totalPrice: Int, totalCount: Int) {
        self.totalCount = totalCount
        self.totalPrice = totalPrice
        super.init(frame: .zero)
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

private extension CartInfoButton {
    func setUI() {
        backgroundColor = .designSystem(.mainGreen)
        menuCountLabel.text = totalCount.description
        totalPriceLabel.text = totalPrice.makePriceLabelFromNumber()
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
    }
    
    func setHierarchy() {
        addSubviews(menuCountLabel, buttonTitleLabel, totalPriceLabel)
    }
    
    func setLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        menuCountLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.size.equalTo(24)
        }
        
        buttonTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        totalPriceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
