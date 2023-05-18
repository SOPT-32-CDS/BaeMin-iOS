//
//  WarningView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 Warning. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class WarningView: UIView {
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body3)
        label.textColor = .designSystem(.gray1)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.text = "우아한 형제들은 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 따라서 우아한형제들은 상품, 거래정보 및 거래에 대해서 책임을 지지 않습니다."
        return label
    }()
    
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

    override func layoutSubviews() {
        super.layoutSubviews()
        warningLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }
}

private extension WarningView {
    func setUI() {
        backgroundColor = .designSystem(.seperateGray)
    }
    
    func setHierarchy() {
        addSubview(warningLabel)
    }
}
