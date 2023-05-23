//
//  CartStoreMenuSectionFooterView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 CartStoreMenuSectionFooter. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CartStoreMenuSectionFooterView: UIView {
    
    private let moreOrderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더 담으러 가기", for: .normal)
        button.setImage(.assetImage(.mini_plus), for: .normal)
        button.titleLabel?.font = .pretendard(.body2Bold)
        button.tintColor = .designSystem(.black)
        return button
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

private extension CartStoreMenuSectionFooterView {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        addSubview(moreOrderButton)
    }
    
    func setLayout() {
        moreOrderButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(22)
            make.width.equalTo(114)
        }
    }
}
