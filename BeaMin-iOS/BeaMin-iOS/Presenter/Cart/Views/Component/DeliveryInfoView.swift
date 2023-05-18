//
//  DeliveryInfoView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 DeliveryInfo. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class DeliveryInfoView: UIView {
    
    private let deliveryIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .assetImage(.oneshipping)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let deliveryTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.bady2)
        label.textColor = .designSystem(.black)
        label.text = "34~44분 후 도착"
        return label
    }()
    
    private let deliveryTipLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body2Bold)
        label.textColor = .designSystem(.black)
        label.text = "배달팁 2,000원"
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
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension DeliveryInfoView {
    func setUI() {
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        self.layer.borderColor = .designSystem(.black)
        self.layer.borderWidth = 1
    }
    
    func setHierarchy() {
        addSubviews(deliveryIcon, deliveryTimeLabel, deliveryTipLabel)
    }
    
    func setLayout() {
        deliveryIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            make.width.equalTo(82)
            make.height.equalTo(20)
        }
        
        deliveryTipLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(12)
        }
        
        deliveryTimeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(deliveryTipLabel.snp.leading).offset(-13)
        }
    }
}
