//
//  OrderMain2View.swift
//  BeaMin-iOS
//
//  Created by 남유진 on 2023/05/19.
//  Copyright (c) 2023 OrderMain2. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderMainView: UIView {
    
    private let menuImage = UIImageView().then {
        $0.image = .assetImage(.sushi)
    }
    
    private let menuNameLabel = UILabel().then {
        $0.text = "정담초밥 송파점"
        $0.font = .pretendard(.title)
        $0.textColor = .designSystem(.black)
    }
    
//    private let starImage = UIImageView().then {
//
//    }
    
    private let starLabel = UILabel().then {
        $0.text = "4.9"
        $0.font = .pretendard(.h3Headline)
        $0.textColor = .designSystem(.black)
    }
    
    private let reviewLabel = UILabel().then {
        $0.text = "리뷰 176개 >"
        $0.font = .pretendard(.body1)
        $0.textColor = .designSystem(.black)
    }
    
    private var informButton = UIButton().then {
        $0.setTitle("  가게정보 ・ 원산지 >  ", for: .normal)
        $0.titleLabel?.font = .pretendard(.body2)
        $0.setTitleColor(UIColor.black , for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = .designSystem(.gray2)
        $0.layer.cornerRadius = 12
    }
    
    private let cescoLabel = UILabel().then {
        $0.text = " 세스코 멤버스 "
        $0.font = .pretendard(.body4)
        $0.textColor = .designSystem(.black)
        $0.layer.backgroundColor = .designSystem(.gray3)
        $0.layer.cornerRadius = 4
    }
    
    private let storeinformView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = .designSystem(.gray2)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 8
    }
    
    private let minPriceTitle = UILabel().then {
        $0.text = "최소 주문금액"
        $0.font = .pretendard(.body2Bold)
        $0.textColor = .designSystem(.gray1)
    }
    
    private let minPriceLabel = UILabel().then {
        $0.text = "15,000원"
        $0.font = .pretendard(.body2)
        $0.textColor = .designSystem(.black)
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .designSystem(.gray2)
    }
    
    private let oneservingImage = UIImageView().then {
        $0.image = .assetImage(.oneshipping)
    }
    
    private let deliverTimeLabel = UILabel().then {
        $0.text = "38~48분 후 도착"
        $0.font = .pretendard(.body2)
        $0.textColor = .designSystem(.black)
    }
    
    private let deliverTipLabel = UILabel().then {
        $0.text = "배달팁 4,440원"
        $0.font = .pretendard(.body2)
        $0.textColor = .designSystem(.black)
    }
    
    private let personalStack = UIStackView().then {
        $0.distribution = .equalSpacing
//        $0.alignment = .leading
//        $0.alignment = .center
    }
    
    private let heartStack = UIStackView()
    
    private let shareStack = UIStackView()
    
    private let togetherStack = UIStackView()
    
    private let section1View = UIView().then {
        $0.backgroundColor = .designSystem(.gray2)
    }
    
    private let section2View = UIView().then {
        $0.backgroundColor = .designSystem(.gray2)
    }
    
    private let heartImage = UIImageView().then {
        $0.image = .assetImage(.heart_3)
        $0.contentMode = .scaleAspectFill
    }
    
    private let heartLabel = UILabel().then {
        $0.text = "173"
        $0.font = .pretendard(.body2)
        $0.textColor = .designSystem(.black)
    }
    
    private let shareImage = UIImageView().then {
        $0.image = .assetImage(.share_3)
        $0.contentMode = .scaleAspectFill
    }
    
    private let shareLabel = UILabel().then {
        $0.text = "공유"
        $0.font = .pretendard(.body2)
        $0.textColor = .designSystem(.black)
    }
    
    private let togetherImage = UIImageView().then {
        $0.image = .assetImage(.together_3)
        $0.contentMode = .scaleAspectFill
    }
    
    private let togetherLabel = UILabel().then {
        $0.text = "함께주문"
        $0.font = .pretendard(.body2)
        $0.textColor = .designSystem(.black)
    }
    
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
        
        // MARK: - delegate설정
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension OrderMainView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubviews(menuImage, menuNameLabel, starLabel, reviewLabel, informButton, cescoLabel, storeinformView, personalStack)
       
        storeinformView.addSubviews(minPriceTitle, minPriceLabel, lineView, oneservingImage, deliverTimeLabel, deliverTipLabel)
        
        heartStack.addArrangedSubview(heartImage)
        heartStack.addArrangedSubview(heartLabel)
        
        shareStack.addArrangedSubview(shareImage)
        shareStack.addArrangedSubview(shareLabel)
        
        togetherStack.addArrangedSubview(togetherImage)
        togetherStack.addArrangedSubview(togetherLabel)
        
        personalStack.addArrangedSubview(heartStack)
        personalStack.addArrangedSubview(section1View)
        personalStack.addArrangedSubview(shareStack)
        personalStack.addArrangedSubview(section2View)
        personalStack.addArrangedSubview(togetherStack)
    }
    
    func setLayout() {
        
        menuImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(225)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.top.equalTo(menuImage.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(20)
        }
        
        starLabel.snp.makeConstraints {
            $0.top.equalTo(menuNameLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(22)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(starLabel.snp.top)
            $0.leading.equalTo(starLabel.snp.trailing).offset(8)
        }
        
        informButton.snp.makeConstraints {
            $0.top.equalTo(reviewLabel.snp.top)
            $0.trailing.equalToSuperview().inset(21)
        }
        
        cescoLabel.snp.makeConstraints {
            $0.top.equalTo(starLabel.snp.bottom).offset(10)
            $0.leading.equalTo(menuNameLabel.snp.leading)
        }
        
        storeinformView.snp.makeConstraints {
            $0.top.equalTo(cescoLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(116)
        }
        
        minPriceTitle.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(15)
        }

        minPriceLabel.snp.makeConstraints {
            $0.top.equalTo(minPriceTitle)
            $0.leading.equalTo(minPriceTitle.snp.trailing).offset(4)
        }

        lineView.snp.makeConstraints {
            $0.top.equalTo(minPriceLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(1)
        }

        oneservingImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(54)
            $0.leading.equalToSuperview().offset(13)
        }

        deliverTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(54)
            $0.leading.equalToSuperview().offset(101)
        }

        deliverTipLabel.snp.makeConstraints {
            $0.top.equalTo(deliverTimeLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(101)
        }
        
        personalStack.snp.makeConstraints {
            $0.top.equalTo(storeinformView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        section1View.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.width.equalTo(1)
        }
        
        section2View.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.width.equalTo(1)
        }
        
        heartImage.snp.makeConstraints {
            $0.size.equalTo(24)
        }
        
        shareImage.snp.makeConstraints {
            $0.size.equalTo(24)
        }
        
        togetherImage.snp.makeConstraints {
            $0.size.equalTo(24)
        }
        
        shareStack.snp.makeConstraints {
//            $0.leading.equalTo(section1View.snp.trailing).offset(38)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(24)
        }
        
        heartStack.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(28)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(24)
        }
        
        togetherStack.snp.makeConstraints {
//            $0.trailing.equalToSuperview().offset(-15)
            $0.width.equalTo(80)
            $0.height.equalTo(24)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
