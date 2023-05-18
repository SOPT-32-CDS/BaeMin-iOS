//
//  DeliveryPriceInfoViewView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 DeliveryPriceInfoView. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class DeliveryPriceInfoView: UIView {
    
    private let totalTip: Int
    
    private let totalPriceTitle: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body1)
        label.textColor = .designSystem(.black)
        label.text = "총 주문금액"
        return label
    }()
    
    private let tipTitle: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body1)
        label.textColor = .designSystem(.black)
        label.text = "배달팁"
        return label
    }()
    
    private let seperatedView = SeperateView(height: 1)
    
    private let estimatedPaymentAmountTitle: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        label.text = "결제예정금액"
        return label
    }()
    
    private let totalPrice: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        label.text = 78600.makePriceLabelFromNumber()
        return label
    }()
    
    private lazy var tip: UILabel = {
        let label = UILabel()
        label.text = totalTip.makePriceLabelFromNumber()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        return label
    }()
    
    private let estimatedPaymentAmount: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        label.text = 80600.makePriceLabelFromNumber()
        return label
    }()
    
    private let warningView = WarningView()
    
    init(totalTip: Int) {
        self.totalTip = totalTip
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

private extension DeliveryPriceInfoView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubviews(totalPriceTitle, tipTitle, estimatedPaymentAmountTitle, totalPrice, tip, estimatedPaymentAmount, seperatedView, warningView)
    }
    
    func setLayout() {
        totalPriceTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.leading.equalToSuperview().inset(15)
        }
        
        tipTitle.snp.makeConstraints { make in
            make.top.equalTo(totalPriceTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(15)
        }
        
        totalPrice.snp.makeConstraints { make in
            make.centerY.equalTo(totalPriceTitle.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
        }
        
        tip.snp.makeConstraints { make in
            make.centerY.equalTo(tipTitle.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
        }
        
        seperatedView.snp.makeConstraints { make in
            make.top.equalTo(tipTitle.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview()
        }
        
        estimatedPaymentAmountTitle.snp.makeConstraints { make in
            make.top.equalTo(seperatedView.snp.bottom).offset(25)
            make.leading.equalToSuperview().inset(15)
        }
        
        estimatedPaymentAmount.snp.makeConstraints { make in
            make.centerY.equalTo(estimatedPaymentAmountTitle.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
        }
        
        warningView.snp.makeConstraints { make in
            make.top.equalTo(estimatedPaymentAmountTitle.snp.bottom).offset(22)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}