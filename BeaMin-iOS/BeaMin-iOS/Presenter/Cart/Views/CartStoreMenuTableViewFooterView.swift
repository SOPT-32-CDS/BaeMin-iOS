//
//  CartStoreMenuTableViewFooterView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 CartStoreMenuTableViewFooter. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CartStoreMenuTableViewFooterView: UIView {
    
    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body1)
        label.textColor = .designSystem(.black)
        label.text = "배달로 받을게요"
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

private extension CartStoreMenuTableViewFooterView {
    func setUI() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
