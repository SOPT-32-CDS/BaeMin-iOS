//
//  BMBasicButton.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/17.
//  Copyright (c) 2023 BMBasicButton. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class BMBasicButton: UIButton {
    
    var price: Int? {
        didSet {
            guard let price else { return }
            self.setTitle(price.makePriceLabelFromNumber()+" 담기", for: .normal)
        }
    }
    
    init(price: Int) {
        super.init(frame: .zero)
        self.setTitle(price.makePriceLabelFromNumber()+" 담기", for: .normal)
        self.titleLabel?.font = .pretendard(.h3Headline)
        self.backgroundColor = .designSystem(.mainGreen)
        self.layer.cornerRadius = 3.36
        self.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .pretendard(.h3Headline)
        self.backgroundColor = .designSystem(.mainGreen)
        self.layer.cornerRadius = 3.36
        self.snp.makeConstraints { make in
            make.height.equalTo(45)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
