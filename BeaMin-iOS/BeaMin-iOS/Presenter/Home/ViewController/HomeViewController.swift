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
    
    private lazy var promotionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
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
        HomePromotionCollectionViewCell.register(collectionView: promotionView)
        
        flowLayout.do {
            $0.scrollDirection = .vertical
            $0.minimumLineSpacing = 8
        }
        
        promotionView.do {
            $0.delegate = self
            $0.dataSource = self
        }
        
        tabBarView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.cornerRadius = 16
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
    }
    
    func setHierarchy() {
        view.addSubviews(promotionView, tabBarView)
    }
    
    func setLayout() {
        
        promotionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        NSLayoutConstraint.activate([
            tabBarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabBarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 83),
            tabBarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("🐰🐰🐰🐰🐰🐰")
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("🍔🍔🍔🍔🍔")
        guard let cell = promotionView.dequeueReusableCell(withReuseIdentifier: HomePromotionCollectionViewCell.identifier, for: indexPath) as? HomePromotionCollectionViewCell else { return UICollectionViewCell() }
        print("🍔🍔🍔🍔🍔")
        return cell
        
    }
    
}
