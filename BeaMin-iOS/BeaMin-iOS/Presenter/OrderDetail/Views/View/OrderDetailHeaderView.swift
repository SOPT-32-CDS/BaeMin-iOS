//
//  OrderDetailHeaderView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/16.
//  Copyright (c) 2023 OrderDetailHeader. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderDetailHeaderView: UIView {
    
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let popularityMark: UIImageView = {
        let imageView = UIImageView(image: .assetImage(.popularityMark))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let menuNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.title)
        label.textColor = .designSystem(.black)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    private let menuDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.bady2)
        label.textColor = .designSystem(.gray1)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let priceTitle: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        label.textAlignment = .left
        label.text = "가격"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        label.textAlignment = .left
        return label
    }()
    
    private let seperateView = SeperateView(height: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(menuImageName: Constant.ImageName, menuName: String, menuDetail: String, menuPrice: Int) {
        self.menuImageView.image = .assetImage(menuImageName)
        self.menuNameLabel.text = menuName
        self.menuDetailLabel.text = menuDetail
        self.priceLabel.text = menuPrice.makePriceLabelFromNumber()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        menuImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Constant.Screen.width*2.0/3.0)
        }
        
        popularityMark.snp.makeConstraints { make in
            make.top.equalTo(menuImageView.snp.bottom).offset(18)
            make.leading.equalToSuperview().inset(17)
            make.size.equalTo(34)
        }
        
        menuNameLabel.snp.makeConstraints { make in
            make.top.equalTo(popularityMark.snp.top)
            make.leading.equalTo(popularityMark.snp.trailing)
            make.trailing.equalToSuperview().inset(22)
        }
        
        menuDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(menuNameLabel.snp.bottom).offset(6)
            make.leading.equalTo(popularityMark.snp.leading)
            make.trailing.equalToSuperview().inset(18)
        }
        
        priceTitle.snp.makeConstraints { make in
            make.top.equalTo(menuDetailLabel.snp.bottom).offset(49)
            make.leading.equalToSuperview().inset(17)
            make.height.equalTo(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceTitle.snp.top)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(20)
        }
        
        seperateView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(18)
            make.leading.trailing.equalToSuperview()
        }
    }
}

private extension OrderDetailHeaderView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubviews(menuImageView, popularityMark, menuNameLabel, menuDetailLabel, priceTitle, priceLabel, seperateView)
    }
}
