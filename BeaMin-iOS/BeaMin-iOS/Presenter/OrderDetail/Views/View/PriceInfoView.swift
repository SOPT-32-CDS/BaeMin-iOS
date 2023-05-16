//
//  PriceInfoView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/17.
//  Copyright (c) 2023 PriceInfo. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class PriceInfoView: UIView {
    
    var price: Int? {
        didSet {
            guard let price else { return }
            self.addCartButton.price = price
        }
    }
    private let minimunPriceForDelivery: Int
    
    private let seperatedView = SeperateView(height: 1.5)
    
    private let addCartButton = BMBasicButton(price: 0)
    
    private let minimunPriceForDeliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "배달최소주문금액"
        label.font = .pretendard(.body3)
        label.textColor = .designSystem(.gray1)
        return label
    }()
    
    private let minimumPrice: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.bady2)
        label.textColor = .designSystem(.black)
        return label
    }()
    
    init(minimunPriceForDelivery: Int) {
        self.minimunPriceForDelivery = minimunPriceForDelivery
        super.init(frame: .zero)
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

private extension PriceInfoView {
    func setUI() {
        backgroundColor = .designSystem(.white)
        minimumPrice.text = minimunPriceForDelivery.makePriceLabelFromNumber()
    }
    
    func setHierarchy() {
        addSubviews(seperatedView, minimunPriceForDeliveryLabel, minimumPrice, addCartButton)
    }
    
    func setLayout() {
        seperatedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        minimunPriceForDeliveryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(14)
        }
        
        minimumPrice.snp.makeConstraints { make in
            make.top.equalTo(minimunPriceForDeliveryLabel.snp.bottom)
            make.leading.equalToSuperview().inset(14)
        }
        
        addCartButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(minimunPriceForDeliveryLabel.snp.trailing).offset(19)
        }
    }
    
    func setAddTarget() {
        
    }
}
