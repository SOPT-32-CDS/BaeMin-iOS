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
    
    private let tabBarView = CustomTabBarView(tabBarItems: [.find, .heart, .logo, .order, .mypage])
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
    }
}

private extension HomeViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)

        tabBarView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.cornerRadius = 16
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
    }
    
    func setHierarchy() {
        view.addSubviews(tabBarView)
    }
    
    func setLayout() {
        
        // MARK: - 이부분 snapkit으로 바꿔주세요
        NSLayoutConstraint.activate([
            tabBarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabBarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 83),
            tabBarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
}
