//
//  HomePromotionViewController.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/20.
//  Copyright (c) 2023 HomePromotion. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomePromotionViewController: UIViewController {
    
    private let homePromotionModel : [HomePromotionItem] = HomePromotionItem.homePromotionDummyData()
    
    private lazy var homePromotionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
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

private extension HomePromotionViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
        HomePromotionCollectionViewCell.register(collectionView: homePromotionView)
        
        flowLayout.do {
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 100, height: 74)
        }
    }
    
    func setHierarchy() {
        view.addSubview(homePromotionView)
    }
    
    func setLayout() {
        homePromotionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        homePromotionView.delegate = self
        homePromotionView.dataSource = self
    }
}

extension HomePromotionViewController : UICollectionViewDelegate {
    
}

extension HomePromotionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomePromotionCollectionViewCell.dequeueReusableCell(collectionView: homePromotionView, indexPath: indexPath)
        cell.setDataBind(model: homePromotionModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePromotionModel.count
    }

}
