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

    // MARK: - UICollectionViewFlowLayout입니다
    private let promotionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        
        // MARK: - delegate설정
        setDelegate()
    }
}

private extension HomeViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
        
        // MARK: - 이렇게 collectionView를 설정하는 부분은 setCollectionVIew같은 함수를 만들어서 viewdidload에서 호출하는게 좋을거같아요!
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
            // MARK: - snapkit으로 바꾸면 translatesAutoresizingMaskIntoConstraints필요없습니다!
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
        
        // MARK: - 이부분 snapkit으로 바꿔주세요
        NSLayoutConstraint.activate([
            tabBarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabBarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 83),
            tabBarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
    
    func setDelegate() {
        promotionView.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

// MARK: - 저희 코드컨벤션중에 protocol을 나눠서 쓰자는 항목이 있었어서 UICollectionViewDelegate랑 UICollectionViewDataSource는 따로 쓰는게 좋아보입니다
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // MARK: - 이부분도 제가 프로토콜 설명하면서 사용법 적어놨습니다!
        // https://github.com/SOPT-32-CDS/BaeMin-iOS/pull/3 여기 5번 한번 확인해주세요!
        let cell = HomePromotionCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("🐰🐰🐰🐰🐰🐰")
        return 4
    }
}
