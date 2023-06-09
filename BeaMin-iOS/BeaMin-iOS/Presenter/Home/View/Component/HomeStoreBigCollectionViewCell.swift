//
//  HomeStoreBigCollectionViewCell.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/20.
//  Copyright (c) 2023 HomeStoreBig. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeStoreBigCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private let homeStoreBigImage = UIImageView()
    private let homeStoreBigTitle = UILabel()
    private let homeStoreBigCoupon = UIImageView()
    
    private let homeStoreBigStarIcon = UIImageView()
    private let homeStoreBigStar = UILabel()
    private let homeStoreBigStarStackView = UIStackView()
    private let homeStoreBigTitleStackView = UIStackView()
    
    private let homeStoreBigIcon = UIImageView()
    private let homeStoreBigDeliveryTime = UILabel()
    private let homeStoreBigDeliveryTipTitle = UILabel()
    private let homeStoreBigDeliveryTip = UILabel()
    private let homeStoreBigInfoStackView = UIStackView()
    
    private let homeStoreBigMinDeliveryTitle = UILabel()
    private let homeStoreBigMinDelivery = UILabel()
    private let homeStoreBigMinDeliveryStackView = UIStackView()

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

extension HomeStoreBigCollectionViewCell {
    func setUI() {
        homeStoreBigImage.do {
            $0.image = UIImage.assetImage(.img_advertise)
            $0.layer.cornerRadius = 10
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.layer.masksToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        homeStoreBigTitle.do {
            $0.font = .pretendard(.h2Headline)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreBigCoupon.do {
            $0.image = .assetImage(.couponImage)
            $0.contentMode = .scaleAspectFit
            $0.layer.contentsGravity = .right
        }
        
        homeStoreBigStarIcon.do {
            $0.image = UIImage.assetImage(.ic_star)
            $0.contentMode = .scaleAspectFill
        }
        
        homeStoreBigStar.do {
            $0.font = .pretendard(.body2Bold)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreBigIcon.do {
            $0.image = UIImage.assetImage(.oneshipping)
        }
        
        homeStoreBigDeliveryTime.do {
            $0.font = .pretendard(.body2)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreBigDeliveryTipTitle.do {
            $0.text = "배달팁"
            $0.font = .pretendard(.body2)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreBigDeliveryTip.do {
            $0.font = .pretendard(.body2)
            $0.textColor = .designSystem(.black)
        }
        
        homeStoreBigMinDeliveryTitle.do {
            $0.text = "최소주문"
            $0.font = .pretendard(.body2Bold)
            $0.textColor = .designSystem(.gray1)
        }
        
        homeStoreBigMinDelivery.do {
            $0.font = .pretendard(.body2)
            $0.textColor = .designSystem(.black)
        }
    }
    
    func setHierarchy() {
        addSubviews(homeStoreBigImage,homeStoreBigTitleStackView,homeStoreBigCoupon,homeStoreBigInfoStackView, homeStoreBigMinDeliveryStackView)
        
        homeStoreBigStarStackView.addSubviews(homeStoreBigStarIcon, homeStoreBigStar)
        homeStoreBigTitleStackView.addSubviews(homeStoreBigTitle, homeStoreBigStarStackView)
        homeStoreBigInfoStackView.addSubviews(  homeStoreBigIcon, homeStoreBigDeliveryTime, homeStoreBigDeliveryTipTitle, homeStoreBigDeliveryTip)
        homeStoreBigMinDeliveryStackView.addSubviews(homeStoreBigMinDeliveryTitle, homeStoreBigMinDelivery)
    }
    
    func setLayout() {
        homeStoreBigImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(186)
        }
        
        homeStoreBigTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        homeStoreBigCoupon.snp.makeConstraints {
            $0.top.equalTo(homeStoreBigImage.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(60)
            $0.height.equalTo(16)
        }
        
        homeStoreBigStarIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2)
            $0.leading.equalTo(homeStoreBigTitle.snp.trailing).offset(4)
        }
        
        homeStoreBigStar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.leading.equalTo(homeStoreBigStarIcon.snp.trailing).offset(2)
        }
        
        homeStoreBigTitleStackView.snp.makeConstraints {
            $0.top.equalTo(homeStoreBigImage.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalTo(homeStoreBigStar.snp.trailing)
            $0.bottom.equalTo(homeStoreBigTitle.snp.bottom)
        }
        
        homeStoreBigIcon.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        homeStoreBigDeliveryTime.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(homeStoreBigIcon.snp.trailing).offset(4)
        }

        homeStoreBigDeliveryTipTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(homeStoreBigDeliveryTime.snp.trailing).offset(10)
        }

        homeStoreBigDeliveryTip.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(homeStoreBigDeliveryTipTitle.snp.trailing).offset(5)
        }

        homeStoreBigInfoStackView.snp.makeConstraints {
            $0.top.equalTo(homeStoreBigTitle.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.bottom.equalToSuperview()
        }

        homeStoreBigMinDeliveryTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }

        homeStoreBigMinDelivery.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(homeStoreBigMinDeliveryTitle.snp.trailing).offset(4)
        }

        homeStoreBigMinDeliveryStackView.snp.makeConstraints {
            $0.top.equalTo(homeStoreBigIcon.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.bottom.equalToSuperview()
        }
    }
    
    func setDataBind(model : HomeDTO) {
        task = homeStoreBigImage.loadImage(from: model.image)
        homeStoreBigTitle.text = model.name
        homeStoreBigStar.text = String(model.rate)
        homeStoreBigDeliveryTime.text = String(model.minDeliveryTime) + "~" + String(model.maxDeliveryTime) + "분"
        homeStoreBigDeliveryTip.text = model.deliveryFee.makePriceLabelFromNumber()
        homeStoreBigMinDelivery.text = model.minOrderAmount.makePriceLabelFromNumber()
        
        
        if model.coupon == "coupon" {
            homeStoreBigCoupon.image = .assetImage(.mainCoupon)
        } else if model.coupon == "direct-coupon" {
            homeStoreBigCoupon.image = .assetImage(.mainNowCoupon)
        } else {
            homeStoreBigCoupon.image = .none
        }
    }
}

