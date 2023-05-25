//
//  HomeStoreBigViewController.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/20.
//  Copyright (c) 2023 HomeStoreBig. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeStoreBigViewController: UIViewController {
    
    private let homeStoreModel : [HomeStore] = HomeStore.dummyHomeStore()
    
    private lazy var homeStoreBigView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
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

private extension HomeStoreBigViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
        HomeStoreBigCollectionViewCell.register(collectionView: homeStoreBigView)
        
        flowLayout.do {
            $0.scrollDirection = .vertical
            $0.itemSize = CGSize(width: 398, height: 280)
        }
    }
    
    func setHierarchy() {
        view.addSubview(homeStoreBigView)
    }
    
    func setLayout() {
        homeStoreBigView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        homeStoreBigView.delegate = self
        homeStoreBigView.dataSource = self
    }
}

extension HomeStoreBigViewController : UICollectionViewDelegate {
    
}

extension HomeStoreBigViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeStoreBigCollectionViewCell.dequeueReusableCell(collectionView: homeStoreBigView, indexPath: indexPath)
//        cell.setDataBind(model: homeStoreModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeStoreModel.count
    }
    
}
