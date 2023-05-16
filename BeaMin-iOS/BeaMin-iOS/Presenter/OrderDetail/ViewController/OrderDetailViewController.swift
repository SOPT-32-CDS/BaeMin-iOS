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
    
    private var singleMenuPrice = 0 {
        didSet {
            if totalMenuCount > 1 {
                priceInfoView.price = singleMenuPrice * totalMenuCount
            } else {
                priceInfoView.price = singleMenuPrice
            }
        }
    }
    
    private lazy var totalMenuCount = 1 {
        didSet {
            priceInfoView.price = singleMenuPrice * totalMenuCount
        }
    }
    
    private let mockData = OrderDetail.orderDetailDummy
    private let OrderDetailTableView = UITableView(frame: .zero, style: .grouped)
    
    private lazy var priceInfoView = PriceInfoView(minimunPriceForDelivery: mockData.minPriceForDelivery)


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
        setData()
    }
}

private extension OrderDetailViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setHierarchy() {
        view.addSubviews(OrderDetailTableView, priceInfoView)
    }
    
    func setLayout() {
        
        OrderDetailTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(priceInfoView.snp.top)
        }
        
        priceInfoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
    }
    
    func setAddTarget() {
    }
    
    func setDelegate() {
        OrderDetailTableView.dataSource = self
        OrderDetailTableView.delegate = self
    }
    
    func setTableView() {
        OrderDetailTableView.separatorStyle = .none
        OrderDetailTableView.sectionFooterHeight = 0
        AddMenuTableViewCell.register(tableView: OrderDetailTableView)
        let headerView = OrderDetailHeaderView(frame: .init(x: 0, y: 0, width: Constant.Screen.width, height: 518))
        headerView.config(menuImageName: mockData.menuImage, menuName: mockData.menuName, menuDetail: mockData.menuDetail, menuPrice: mockData.menuPrice)
        OrderDetailTableView.tableHeaderView = headerView
        OrderDetailTableView.contentInsetAdjustmentBehavior = .never
        let footerView = OrderDetailFooterViewView(frame: .init(x: 0, y: 0, width: Constant.Screen.width, height: 80))
        footerView.stepperView.delegate = self
        OrderDetailTableView.tableFooterView = footerView
    }
    
    func setData() {
        self.singleMenuPrice += mockData.menuPrice
        print("현재금액은 \(self.singleMenuPrice)")
    }
}

extension OrderDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mockData.addOrder.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.addOrder[section].addMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AddMenuTableViewCell.dequeueReusableCell(tableView: tableView)
        cell.delegate = self
        cell.selectionStyle = .none
        cell.data = mockData.addOrder[indexPath.section].addMenu[indexPath.row]
        return cell
    }
    
    
}

extension OrderDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = OrderDetailSectionHeaderView()
        sectionHeaderView.config(title: mockData.addOrder[section].addMenuName, maxCount: mockData.addOrder[section].addMenu.count)
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension OrderDetailViewController: priceDelegate {
    func priceChangeBySubMenu(isSelect: Bool, price: Int) {
        isSelect ? (singleMenuPrice += price) : (singleMenuPrice -= price)
    }
}

extension OrderDetailViewController: menuCountDelegate {
    func priceChangeByMenuCount(menuCont: Int) {
        self.totalMenuCount = menuCont
    }
}
