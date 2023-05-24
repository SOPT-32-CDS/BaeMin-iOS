//
//  OrderMain2ViewController.swift
//  BeaMin-iOS
//
//  Created by 남유진 on 2023/05/18.
//  Copyright (c) 2023 OrderMain2. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderMainViewController: UIViewController {
    
    private let OrderMainTableView = UITableView()
    
    private let mockData = StoreDetail.storeDetailDummy
    
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
        
//        setRegister()
        
        // MARK: - delegate설정
        setDelegate()

        setTableView()
    }
}

private extension OrderMainViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        view.addSubviews(OrderMainTableView)
    }
    
    func setLayout() {
        
        OrderMainTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        OrderMainTableView.dataSource = self
        OrderMainTableView.delegate = self
    }
    
    func setTableView() {
        PopularMenuTableViewCell.register(tableView: OrderMainTableView)
        OrderMainTableView.rowHeight = 182
        OrderMainTableView.sectionFooterHeight = 0
        
        PopularMenuTableViewCell.register(tableView: OrderMainTableView)
        let headerView = OrderMainView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 536))
        headerView.config(storeName: mockData.storeName, storeStars: mockData.storeStars, storeReviews: mockData.storeReviews, minPrice: mockData.minPrice, deliverTime: mockData.deliverTime, deliverTips: mockData.deliverTips)
        OrderMainTableView.tableHeaderView = headerView

//        testTableView.rowHeight = 182
    }
}

extension OrderMainViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return mockData.menuOrder.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.menuOrder[section].menuDetail.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mockData.menuOrder[section].menuName
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PopularMenuTableViewCell.dequeueReusableCell(tableView: tableView)
        cell.selectionStyle = .none
        cell.data = mockData.menuOrder[indexPath.section].menuDetail[indexPath.row]
        return cell
    }
}

extension OrderMainViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
}
