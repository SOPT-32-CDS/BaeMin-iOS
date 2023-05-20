//
//  HomeMenuViewController.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/19.
//  Copyright (c) 2023 HomeMenu. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeMenuViewController: UIViewController {
    

    public override func viewDidLoad() {
        super.viewDidLoad()
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
}

private extension HomeMenuViewController {
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
