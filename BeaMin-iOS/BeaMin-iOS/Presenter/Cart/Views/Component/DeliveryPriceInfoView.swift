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
    
    var totalPrice: Int {
        didSet {
            self.totalPriceLabel.text = totalPrice.makePriceLabelFromNumber()
            self.estimatedPaymentAmount.text = (totalPrice + totalTip).makePriceLabelFromNumber()
        }
    }
    
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
    
    private var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
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
        return label
    }()
    
    private let warningView = WarningView()
    
    init(totalTip: Int, totalPrice: Int) {
        self.totalPrice = totalPrice
        self.totalTip = totalTip
        super.init(frame: .zero)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        totalPriceTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.leading.equalToSuperview().inset(15)
        }
        
        tipTitle.snp.makeConstraints { make in
            make.top.equalTo(totalPriceTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(15)
        }
        
        totalPriceLabel.snp.makeConstraints { make in
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

private extension DeliveryPriceInfoView {
    func setUI() {
        backgroundColor = .designSystem(.white)
        self.totalPriceLabel.text = totalPrice.makePriceLabelFromNumber()
        self.estimatedPaymentAmount.text = (totalPrice + totalTip).makePriceLabelFromNumber()
    }
    
    func setHierarchy() {
        addSubviews(totalPriceTitle, tipTitle, estimatedPaymentAmountTitle, totalPriceLabel, tip, estimatedPaymentAmount, seperatedView, warningView)
    }
}
