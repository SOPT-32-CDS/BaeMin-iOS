//
//  OrderDetailSectionHeaderView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/17.
//  Copyright (c) 2023 OrderDetailSectionHeader. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderDetailSectionHeaderView: UIView {
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h1Headline)
        label.textColor = .designSystem(.black)
        return label
    }()
    
    private let maximunLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.bady2)
        label.textColor = .designSystem(.gray1)
        return label
    }()
    
    private let choiceLabel = ChoiceChipView()
    
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
    
    func config(title: String, maxCount: Int) {
        self.title.text = title
        self.maximunLabel.text = "최대 \(maxCount)개 선택"
    }
}

private extension OrderDetailSectionHeaderView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubviews(title, maximunLabel, choiceLabel)
    }
    
    func setLayout() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(20)
        }
        maximunLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(20)
        }
        
        choiceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(title.snp.centerY)
            make.trailing.equalToSuperview().inset(25)
        }
    }
}
