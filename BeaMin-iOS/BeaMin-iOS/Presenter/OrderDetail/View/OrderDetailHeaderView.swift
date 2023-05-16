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
        
        // MARK: - 삭제
        imageView.image = .assetImage(.menuImage)
        
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
        
        // MARK: - 알게된것
        label.lineBreakMode = .byCharWrapping
        
        // MARK: - 삭제
        label.text = "[커플주문률1위]2인세트A+미니우동2"
        
        return label
    }()
    
    private let menuDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.bady2)
        label.textColor = .designSystem(.gray1)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        // MARK: - 삭제
        label.text = "초밥24p+날치알대마끼2p+고로케2p\n(흰살생선2p, 연어2p, 토핑연어2p,초새우2p,생새우2p,\n간장새우2p,한치2p,계란2p,소고기 스테이크"
        
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
        label.text = "34,000원"
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

private extension OrderDetailHeaderView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubviews(menuImageView, popularityMark, menuNameLabel, menuDetailLabel, priceTitle, priceLabel)
    }
    
    func setLayout() {
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
    }
}
