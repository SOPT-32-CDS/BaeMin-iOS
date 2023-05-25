//
//  HomeAdvertiseCollectionViewCell.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/25.
//  Copyright (c) 2023 HomeAdvertise. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeAdvertiseCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    private let advertiseImage = UIImageView()

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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeAdvertiseCollectionViewCell {
    func setUI() {
        advertiseImage.do {
            $0.image = .assetImage(.img_advertise)
        }
    }
    
    func setHierarchy() {
        addSubview(advertiseImage)
    }
    
    func setLayout() {
        advertiseImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(144)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
