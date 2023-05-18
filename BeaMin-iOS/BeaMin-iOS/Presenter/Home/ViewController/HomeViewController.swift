//
//  HomeViewController.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/18.
//  Copyright (c) 2023 Home. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeViewController: UIViewController {
    
    let tabBarView = CustomTabBarView(tabBarItems: [.find, .heart, .logo, .order, .mypage])
    
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

private extension HomeViewController {
    func setUI() {
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.layer.cornerRadius = 16
        tabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setHierarchy() {
        view.addSubview(tabBarView)
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            tabBarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabBarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 83),
            tabBarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
