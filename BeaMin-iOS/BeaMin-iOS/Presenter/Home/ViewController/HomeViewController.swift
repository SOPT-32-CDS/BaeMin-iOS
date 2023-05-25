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
    
    private typealias SectionType = Section
    
    @frozen
    private enum Section: CaseIterable {
        case advertise, promotion, menu, storeSmall, chip, storeBig
    }
    
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    private let promotionData : [HomePromotionItem] = HomePromotionItem.homePromotionDummyData()
    private let menuData : [HomeMenuItem] = HomeMenuItem.homeMenuDummyData()
    private var chipData : [HomeChipItem] = HomeChipItem.homeChipMenuData() {
        didSet {
            self.homeCollectionView.reloadData()
        }
    }
    
    private var homeData: [HomeDTO] = []
    
    private let navigationBar = MainNavigationView()
    
    private let tabBarView = CustomTabBarView(tabBarItems: [.find, .heart, .logo, .order, .mypage])

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
        setDelegate()
        
        setRegister()
    }
}

private extension HomeViewController {
    func setData() {
        HomeManager.homeShared.homeData { response in
            switch response {
            case .success(let data) :
                guard let data = data as? Home else {return}
                self.homeData = data.convertHomeDTO()
                self.homeCollectionView.reloadData()
                dump(self.homeData)
            default :
                break
            }
        }
    }
    
    func setUI() {
        view.backgroundColor = .designSystem(.white)
        navigationController?.navigationBar.isHidden = true
        
        homeCollectionView.do {
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = true
            $0.backgroundColor = .clear
            $0.clipsToBounds = true
            $0.contentInsetAdjustmentBehavior = .never
            $0.collectionViewLayout = self.setSectionLayout()
        }

        tabBarView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.cornerRadius = 16
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
    }
    
    func setHierarchy() {
        view.addSubviews(homeCollectionView, tabBarView, navigationBar)
    }
    
    func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(110)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
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
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    func setRegister() {
        homeCollectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeaderView")
        homeCollectionView.register(SectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionFooterView")
        
        HomeAdvertiseCollectionViewCell.register(collectionView: homeCollectionView)
        HomePromotionCollectionViewCell.register(collectionView: homeCollectionView)
        HomeMenuCollectionViewCell.register(collectionView: homeCollectionView)
        HomeStoreSmallCollectionViewCell.register(collectionView: homeCollectionView)
        HomeChipCollectionViewCell.register(collectionView: homeCollectionView)
        HomeStoreBigCollectionViewCell.register(collectionView: homeCollectionView)
    }
    
    func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = SectionType.allCases[sectionIndex]
            switch sectionType {
            case .advertise:
                return self.getLayoutAdvertiseSection()
            case .promotion:
                return self.getLayoutPromotionSection()
            case .menu:
                return self.getLayoutMenuSection()
            case .storeSmall:
                return self.getLayoutStoreSmallSection()
            case .chip:
                return self.getLayoutChipSection()
            case .storeBig :
                return self.getLayoutStoreBigSection()
            }
        }
    }
    
    func getLayoutAdvertiseSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(144)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 0, bottom: 12, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func getLayoutPromotionSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.1),
            heightDimension: .absolute(120)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 45, leading: 14, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func getLayoutMenuSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(48),
            heightDimension: .absolute(70)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.185),
            heightDimension: .absolute(350)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(15)
        )
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .bottom
        )
        footer.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: -30, bottom: 20, trailing: -30)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 30, bottom: 0, trailing: 30)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [footer]
        
        return section
    }

    func getLayoutStoreSmallSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(158),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.2),
            heightDimension: .absolute(300)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 48, leading: 15, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 12, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [header]
        
        return section
    }

    func getLayoutChipSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.2),
            heightDimension: .absolute(37)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.1),
            heightDimension: .absolute(50)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(15)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: -30, bottom: 20, trailing: -30)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 12, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [header]
        
        return section
    }

    func getLayoutStoreBigSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(280)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .absolute(900)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 15, bottom: 15, trailing: 15)
        
        return section
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .advertise :
            let cell = HomeAdvertiseCollectionViewCell.dequeueReusableCell(collectionView: homeCollectionView, indexPath: indexPath)
            return cell
        case .promotion:
            let cell = HomePromotionCollectionViewCell.dequeueReusableCell(collectionView: homeCollectionView, indexPath: indexPath)
            cell.setDataBind(model: promotionData[indexPath.row])
            return cell
        case .menu:
            let cell = HomeMenuCollectionViewCell.dequeueReusableCell(collectionView: homeCollectionView, indexPath: indexPath)
            cell.setDataBind(model: menuData[indexPath.row])
            return cell
        case .storeSmall :
            let cell = HomeStoreSmallCollectionViewCell.dequeueReusableCell(collectionView: homeCollectionView, indexPath: indexPath)

            if (homeData.count == 3) {
                cell.setDataBind(model: homeData[indexPath.row])
            }
            
            return cell
        case .chip :
            let cell = HomeChipCollectionViewCell.dequeueReusableCell(collectionView: homeCollectionView, indexPath: indexPath)
            cell.setDataBind(model: chipData[indexPath.row])
            cell.handler = { [weak self] in
                guard let self else { return }
                self.chipData[indexPath.item].chipTapped.toggle()
            }
            return cell
        case .storeBig :
            let cell = HomeStoreBigCollectionViewCell.dequeueReusableCell(collectionView: homeCollectionView, indexPath: indexPath)
            
            if (homeData.count == 3) {
                cell.setDataBind(model: homeData[indexPath.row])
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .advertise :
            return 1
        case .promotion:
            return promotionData.count
        case .menu :
            return menuData.count
        case .storeSmall :
            return homeData.count
        case .chip :
            return chipData.count
        case .storeBig :
            return homeData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .advertise:
            let view = UICollectionReusableView()
            return view
        case .promotion:
            let view = UICollectionReusableView()
            return view
        case .menu:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionFooterView", for: indexPath) as! SectionFooterView
            return footerView
        case .storeSmall:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
            return headerView
        case .chip:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionFooterView", for: indexPath) as! SectionFooterView
            return headerView
        case .storeBig:
            let view = UICollectionReusableView()
            return view
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }

}
