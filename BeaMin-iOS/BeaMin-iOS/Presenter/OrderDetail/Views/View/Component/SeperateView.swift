//
//  SeperateView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/17.
//  Copyright (c) 2023 Seperate. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class SeperateView: UIView {
    
    init(height: CGFloat) {
        super.init(frame: .zero)
        self.backgroundColor = .designSystem(.seperateGray)
        self.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
