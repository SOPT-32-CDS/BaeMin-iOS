//
//  CartInfoView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 CartInfo. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CartInfoView: UIView {
    
    private let delivertTip: Int
    
    private let topSeperatedView = SeperateView(height: 10)

    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body1)
        label.textColor = .designSystem(.black)
        label.text = "배달로 받을게요"
        return label
    }()
    
    private let deliveryInfoView = DeliveryInfoView()
    
    private let bottomSeperatedView = SeperateView(height: 10)
    
    private lazy var priceInfoView = DeliveryPriceInfoView(totalTip: delivertTip)
    
    
    init(delivertTip: Int, frame: CGRect) {
        self.delivertTip = delivertTip
        super.init(frame: frame)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topSeperatedView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        deliveryLabel.snp.makeConstraints { make in
            make.top.equalTo(topSeperatedView.snp.bottom).offset(26)
            make.leading.equalToSuperview().inset(15)
        }
        
        deliveryInfoView.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabel.snp.bottom).offset(26)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(52)
        }
        
        bottomSeperatedView.snp.makeConstraints { make in
            make.top.equalTo(deliveryInfoView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        priceInfoView.snp.makeConstraints { make in
            make.top.equalTo(bottomSeperatedView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}

private extension CartInfoView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubviews(topSeperatedView, deliveryLabel, deliveryInfoView, bottomSeperatedView, priceInfoView)
    }
    
    func setLayout() {

    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
