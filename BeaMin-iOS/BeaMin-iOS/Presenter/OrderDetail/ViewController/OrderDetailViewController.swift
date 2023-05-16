//
//  OrderDetailViewController.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/16.
//  Copyright (c) 2023 OrderDetail. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderDetailViewController: UIViewController {
    
    private let mockData = OrderDetail.orderDetailDummy.addOrder
    
    let testView = OrderDetailHeaderView()
    let testTableView = UITableView()

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

        setTableView()
    }
}

private extension OrderDetailViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        view.addSubview(testView)
        view.addSubview(testTableView)
    }
    
    func setLayout() {
        testView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(500)
        }
        
        testTableView.snp.makeConstraints { make in
            make.top.equalTo(testView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setAddTarget() {
    }
    
    func setDelegate() {
        testTableView.dataSource = self
    }
    
    func setTableView() {
        AddMenuTableViewCell.register(tableView: testTableView)
    }
}

extension OrderDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData[section].addMenu.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mockData[section].addMenuName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AddMenuTableViewCell.dequeueReusableCell(tableView: tableView)
        cell.data = mockData[indexPath.section].addMenu[indexPath.row]
        return cell
    }
    
    
}
