//
//  CartStoreMenuSectionHeaderView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 CartStoreMenuSectionHeader. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CartStoreMenuSectionHeaderView: UIView {
    
    private var task: URLSessionDataTask?
    
    private let sectionLine = SeperateView(height: 10)
    
    private let storeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let storeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
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
    
    func configure(storeName: String, storeImage: String) {
        task = self.storeImage.loadImage(from: storeImage)
        self.storeNameLabel.text = storeName
    }

}

private extension CartStoreMenuSectionHeaderView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubviews(sectionLine, storeImage, storeNameLabel)
    }
    
    func setLayout() {
        
        sectionLine.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        storeImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(5)
            make.leading.equalToSuperview().inset(15)
            make.size.equalTo(24)
        }
        
        storeNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(5)
            make.leading.equalTo(storeImage.snp.trailing).offset(7)
            make.trailing.equalToSuperview().inset(15)
        }
    }
}
