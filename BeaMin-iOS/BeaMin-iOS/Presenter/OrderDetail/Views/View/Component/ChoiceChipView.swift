//
//  ChoiceChipView.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/17.
//  Copyright (c) 2023 ChoiceChip. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class ChoiceChipView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "선택"
        label.font = .pretendard(.body3)
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
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }

}

private extension ChoiceChipView {
    func setUI() {
        self.backgroundColor = .designSystem(.gray3)
    }
    
    func setHierarchy() {
        addSubviews(label)
    }
    
    func setLayout() {
        
        self.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
