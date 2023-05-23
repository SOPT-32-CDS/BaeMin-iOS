//
//  HomeChipViewController.swift
//  BeaMin-iOS
//
//  Created by 고아라 on 2023/05/22.
//  Copyright (c) 2023 HomeChip. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class HomeChipViewController: UIViewController {
    
    private var homeChipModel : [HomeChipItem] = HomeChipItem.homeChipMenuData() {
        didSet {
            self.homeChipView.reloadData()
        }
    }
    
    private lazy var homeChipView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout()
    
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

private extension HomeChipViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
        HomeChipCollectionViewCell.register(collectionView: homeChipView)
        
        flowLayout.do {
            $0.minimumInteritemSpacing = 8
            $0.scrollDirection = .horizontal
            
        }
    }
    
    func setHierarchy() {
        view.addSubview(homeChipView)
    }
    
    func setLayout() {
        homeChipView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
    }
    
    func setDelegate() {
        homeChipView.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension HomeChipViewController : UICollectionViewDelegate {
    
}

extension HomeChipViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellSize = CGSize(width: homeChipModel[indexPath.row].chipTitle.size().width + 46 , height: 37)
        return cellSize
    }
}

extension HomeChipViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = HomeChipCollectionViewCell.dequeueReusableCell(collectionView: homeChipView, indexPath: indexPath)
        cell.setDataBind(model: homeChipModel[indexPath.row])
        cell.handler = { [weak self] in
            guard let self else { return }
            self.homeChipModel[indexPath.item].chipTapped.toggle()
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeChipModel.count
    }
    
}

