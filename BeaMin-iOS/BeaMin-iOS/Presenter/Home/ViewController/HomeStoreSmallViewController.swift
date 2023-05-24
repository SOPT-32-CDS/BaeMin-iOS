//
//  HomeStoreSmallViewController.swift
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

final class HomeStoreSmallViewController: UIViewController {
    
    private let homeStoreModel : [HomeStore] = HomeStore.dummyHomeStore()
    
    private lazy var homeStoreView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
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

private extension HomeStoreSmallViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
        HomeStoreSmallCollectionViewCell.register(collectionView: homeStoreView)
        
        flowLayout.do {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 158, height: 283)
        }

    }
    
    func setHierarchy() {
        view.addSubview(homeStoreView)
    }
    
    func setLayout() {
        homeStoreView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
        
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        homeStoreView.delegate = self
        homeStoreView.dataSource = self
    }
}

extension HomeStoreSmallViewController : UICollectionViewDelegate {
    
}

extension HomeStoreSmallViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeStoreSmallCollectionViewCell.dequeueReusableCell(collectionView: homeStoreView, indexPath: indexPath)
        cell.setDataBind(model: homeStoreModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeStoreModel.count
    }

}
