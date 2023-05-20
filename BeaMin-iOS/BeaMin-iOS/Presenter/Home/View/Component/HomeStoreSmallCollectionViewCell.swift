//
//  HomeStoreSmallCollectionViewCell.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/20.
//  Copyright (c) 2023 HomeStoreSmall. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeStoreSmallCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    

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

private extension HomeStoreSmallCollectionViewCell {
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
