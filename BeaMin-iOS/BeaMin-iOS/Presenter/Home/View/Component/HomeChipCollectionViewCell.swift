//
//  HomeChipCollectionViewCell.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/22.
//  Copyright (c) 2023 HomeChip. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeChipCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private let homeChipButton = UIButton()
    var isTapped: Bool = false {
        didSet {
            tapped()
        }
    }
    var handler: (() -> (Void))?
    
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

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeChipCollectionViewCell {
    func setUI() {
        homeChipButton.do {
            $0.titleLabel?.font = .pretendard(.body2Bold)
            $0.setTitleColor(.designSystem(.black), for: .normal)
            $0.backgroundColor = .designSystem(.gray3)
            $0.layer.cornerRadius = 19
            $0.layer.borderColor = .designSystem(.gray2)
            $0.layer.borderWidth = 1
            $0.contentEdgeInsets = .init(top: 0, left: 14, bottom: 0, right: 14)
            $0.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -6)
        }
    }
    
    func setHierarchy() {
        addSubview(homeChipButton)
    }
    
    func setLayout() {
        homeChipButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(83)
            $0.height.equalTo(37)
        }
    }
    
    func setAddTarget() {
        homeChipButton.do {
            $0.addTarget(self, action: #selector(chipButtonTapped), for: .touchUpInside)
        }
    }
    
    func setDataBind(model : HomeChipItem) {
        homeChipButton.do {
            $0.setImage(model.chipImage, for: .normal)
            $0.setTitle(model.chipTitle, for: .normal)
            if model.chipTitle == "기본순" {
                $0.backgroundColor = .designSystem(.white)
            }
        }
        isTapped = model.chipTapped
    }
    
    @objc
    func chipButtonTapped() {
        handler?()
    }
    
    func tapped() {
        if isTapped {
            homeChipButton.do {
                $0.backgroundColor = .designSystem(.lightGreen)
                $0.layer.borderColor = .designSystem(.chipBorderGreen)
            }
        }
        else {
            homeChipButton.do {
                $0.backgroundColor = .designSystem(.gray3)
                $0.layer.borderColor = .designSystem(.gray2)
            }
        }
    }
}
