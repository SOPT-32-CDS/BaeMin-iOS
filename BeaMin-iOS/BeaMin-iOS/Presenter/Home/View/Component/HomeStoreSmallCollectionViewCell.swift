//
//  HomeStoreSmallCollectionViewCell.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/20.
//  Copyright (c) 2023 HomeStoreSmall. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeStoreSmallCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private let homeStoreSmallImage = UIImageView()
    private let homeStoreSmallTItle = UILabel()
    
    private let homeStoreSmallStarIcon = UIImageView()
    private let homeStoreSmallStar = UILabel()
    private let homeStoreSmallStarStackView = UIStackView()
    private let homeStoreSmallTitleStackView = UIStackView()
    
    private let homeStoreSmallDeliveryTitle = UILabel()
    private let homeStoreSmallDeliveryTime = UILabel()
    private let homeStoreSmallDeliveryStackView = UIStackView()
    
    private let homeStoreSmallDeliveryTipTitle = UILabel()
    private let homeStoreSmallDeliveryTipMoney = UILabel()
    private let homeStoreSmallDeliveryTipStackView = UIStackView()
    
    private let homeStoreSmallIcon = UIImageView()
    private let homeStoreSmallCoupon = UIImageView()
    
    private var task: URLSessionDataTask?

    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeStoreSmallCollectionViewCell {
    func setUI() {
        backgroundColor = .designSystem(.white)
        
        homeStoreSmallImage.do {
            $0.image = UIImage.assetImage(.img_test)
            $0.layer.cornerRadius = 7
            $0.layer.masksToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        homeStoreSmallTItle.do {
            $0.font = .pretendard(.body2Bold)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreSmallStarIcon.do {
            $0.image = UIImage.assetImage(.ic_star)
        }
        
        homeStoreSmallStar.do {
            $0.font = .pretendard(.body3Bold)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreSmallDeliveryTitle.do {
            $0.text = "배달"
            $0.font = .pretendard(.body2Bold)
            $0.textColor = .designSystem(.gray1)
        }
        
        homeStoreSmallDeliveryTime.do {
            $0.font = .pretendard(.body2)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreSmallDeliveryTipTitle.do {
            $0.text = "배달팁"
            $0.font = .pretendard(.body2Bold)
            $0.textColor = .designSystem(.gray1)
        }
        
        homeStoreSmallDeliveryTipMoney.do {
            $0.font = .pretendard(.body2)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreSmallIcon.do {
            $0.image = UIImage.assetImage(.oneshipping)
        }
        
        homeStoreSmallCoupon.do {
            $0.image = UIImage.assetImage(.couponImage)
            $0.contentMode = .scaleAspectFit
            $0.layer.contentsGravity = .left
        }
        
    }
    
    func setHierarchy() {
        addSubviews(homeStoreSmallImage, homeStoreSmallTitleStackView, homeStoreSmallDeliveryStackView,homeStoreSmallDeliveryTipStackView, homeStoreSmallIcon, homeStoreSmallCoupon)
        
        homeStoreSmallStarStackView.addSubviews(homeStoreSmallStarIcon, homeStoreSmallStar)
        homeStoreSmallTitleStackView.addSubviews(homeStoreSmallTItle, homeStoreSmallStarStackView)
        homeStoreSmallDeliveryStackView.addSubviews(homeStoreSmallDeliveryTitle, homeStoreSmallDeliveryTime)
        homeStoreSmallDeliveryTipStackView.addSubviews(homeStoreSmallDeliveryTipTitle, homeStoreSmallDeliveryTipMoney)
    }
    
    func setLayout() {
        homeStoreSmallImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(4)
            $0.width.height.equalTo(150)
        }
        
        homeStoreSmallTItle.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        homeStoreSmallStarIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.leading.equalTo(homeStoreSmallTItle.snp.trailing).offset(8)
        }
        
        homeStoreSmallStar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.leading.equalTo(homeStoreSmallStarIcon.snp.trailing).offset(2)
        }
        
        homeStoreSmallTitleStackView.snp.makeConstraints {
            $0.top.equalTo(homeStoreSmallImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.bottom.equalToSuperview()
        }
        
        homeStoreSmallDeliveryTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        homeStoreSmallDeliveryTime.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(homeStoreSmallDeliveryTitle.snp.trailing).offset(4)
        }
        
        homeStoreSmallDeliveryStackView.snp.makeConstraints {
            $0.top.equalTo(homeStoreSmallTItle.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.bottom.equalToSuperview()
        }
        
        homeStoreSmallDeliveryTipTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        homeStoreSmallDeliveryTipMoney.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(homeStoreSmallDeliveryTipTitle.snp.trailing).offset(4)
        }

        homeStoreSmallDeliveryTipStackView.snp.makeConstraints {
            $0.top.equalTo(homeStoreSmallDeliveryTitle.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.bottom.equalToSuperview()
        }


        homeStoreSmallIcon.snp.makeConstraints {
            $0.top.equalTo(homeStoreSmallDeliveryTipTitle.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(4)
        }

        homeStoreSmallCoupon.snp.makeConstraints {
            $0.top.equalTo(homeStoreSmallIcon.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(4)
            $0.width.equalTo(60)
            $0.height.equalTo(16)
        }
        
    }
    
    func setDataBind(model : HomeDTO) {
        task = homeStoreSmallImage.loadImage(from: model.image)
        homeStoreSmallTItle.text = model.name
        homeStoreSmallStar.text = String(model.rate)
        homeStoreSmallDeliveryTime.text = String(model.minDeliveryTime) + "~" + String(model.maxDeliveryTime) + "분"
        homeStoreSmallDeliveryTipMoney.text = String(model.deliveryFee.makePriceLabelFromNumber())

        if model.coupon == "coupon" {
            homeStoreSmallCoupon.image = .assetImage(.mainCoupon)
        } else if model.coupon == "direct-coupon" {
            homeStoreSmallCoupon.image = .assetImage(.mainNowCoupon)
        } else {
            homeStoreSmallCoupon.image = .none
        }
    }
}
