//
//  SectionFooterView.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/25.
//  Copyright (c) 2023 SectionFooter. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class SectionFooterView: UICollectionReusableView {
    
    static let identifier = "SectionFooterView"
    
    private let footerView = UIView()
    
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

private extension SectionFooterView {
    func setUI() {
        footerView.do {
            $0.backgroundColor = .designSystem(.seperateGray)
        }
    }
    
    func setHierarchy() {
        addSubview(footerView)
    }
    
    func setLayout() {
        footerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
