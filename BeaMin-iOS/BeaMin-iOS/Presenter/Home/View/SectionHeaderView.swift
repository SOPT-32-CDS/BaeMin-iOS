//
//  SectionHeaderView.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/25.
//  Copyright (c) 2023 SectionHeader. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class SectionHeaderView: UICollectionReusableView {
    
    static let identifier = "SectionHeaderView"
    
    private let headerLabel = UILabel()
    
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

private extension SectionHeaderView {
    func setUI() {
        headerLabel.do {
            $0.text = "SNS에서 뜨는 맛집!"
            $0.font = .pretendard(.h1Headline)
            $0.textColor = .designSystem(.black)
        }
    }
    
    func setHierarchy() {
        addSubview(headerLabel)
    }
    
    func setLayout() {
        headerLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
