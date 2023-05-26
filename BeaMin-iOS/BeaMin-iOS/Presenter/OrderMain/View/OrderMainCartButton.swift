//
//  OrderMainCartButtonView.swift
//  BeaMin-iOS
//
//  Created by 남유진 on 2023/05/25.
//  Copyright (c) 2023 OrderMainCartButton. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderMainCartButton: UIButton{
    
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
    
    private let menuCountLabel = UILabel().then {
        $0.font = .pretendard(.body2Bold)
        $0.textColor = .designSystem(.mainGreen)
        $0.backgroundColor = .designSystem(.white)
        $0.textAlignment = .center
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    private let buttonTitleLabel = UILabel().then {
        $0.font = .pretendard(.h2Headline)
        $0.textColor = .designSystem(.white)
        $0.text = "장바구니 보기"
    }
    
    private let totalPriceLabel = UILabel().then {
        $0.font = .pretendard(.body2Bold)
        $0.textColor = .designSystem(.white)
    }
    
    
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

private extension OrderMainCartButton {
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
        self.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        menuCountLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(24)
        }
        
        buttonTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        totalPriceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
