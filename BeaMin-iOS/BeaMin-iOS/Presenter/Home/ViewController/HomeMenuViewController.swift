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
    
    private let homeMenuModel : [HomeMenuItem] = HomeMenuItem.homeMenuDummyData()
    
    private lazy var homeMenuView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
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
        view.backgroundColor = .designSystem(.white)
        HomeMenuCollectionViewCell.register(collectionView: homeMenuView)
        
        flowLayout.do {
            $0.minimumInteritemSpacing = 32
            $0.itemSize = CGSize(width: 48, height: 70)
        }
    }
    
    func setHierarchy() {
        view.addSubview(homeMenuView)
    }
    
    func setLayout() {
        homeMenuView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaInsets)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    func setAddTarget() {
    }
    
    func setDelegate() {
        homeMenuView.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension HomeMenuViewController : UICollectionViewDelegate {
    
}

extension HomeMenuViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeMenuCollectionViewCell.dequeueReusableCell(collectionView: homeMenuView, indexPath: indexPath)
        cell.setDataBind(model: homeMenuModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
}
