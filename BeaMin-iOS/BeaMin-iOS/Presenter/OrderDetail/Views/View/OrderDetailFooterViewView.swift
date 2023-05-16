//
//  OrderDetailFooterViewView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/17.
//  Copyright (c) 2023 OrderDetailFooterView. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderDetailFooterViewView: UIView {
    
    private let seperatedView = SeperateView(height: 1.5)
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "수량"
        label.font = .pretendard(.h1Headline)
        label.textColor = .designSystem(.black)
        return label
    }()
    
    let stepperView = MenuStepperView()
    
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

private extension OrderDetailFooterViewView {
    func setUI() {
        backgroundColor = .designSystem(.white)
        addSubviews(seperatedView, label, stepperView)
    }
    
    func setHierarchy() {
        
        seperatedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(25)
        }
        
        stepperView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(22)
            make.width.equalTo(156)
            make.height.equalTo(50)
        }
    }
    
    func setLayout() {
        
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
