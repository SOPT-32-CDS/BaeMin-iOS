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
            priceInfoView.price = totalMenuCount > 1 ? singleMenuPrice * totalMenuCount : singleMenuPrice
        }
    }
    
    private lazy var totalMenuCount = 1 {
        didSet {
            priceInfoView.price = singleMenuPrice * totalMenuCount
        }
    }
    private let navigationBar = BMNavigationBar()
    private let navigationBarBackGroundView = UIView()
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
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationBarBackGroundView.backgroundColor = .designSystem(.white)
        self.navigationBarBackGroundView.layer.opacity = 0
    }
    
    func setHierarchy() {
        view.addSubviews(OrderDetailTableView, priceInfoView, navigationBarBackGroundView, navigationBar)
    }
    
    func setLayout() {
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        OrderDetailTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(priceInfoView.snp.top)
        }
        
        navigationBarBackGroundView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(navigationBar.snp.bottom)
        }
        
        priceInfoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
    }
    
    func setAddTarget() {
        priceInfoView.addCartButton.addButtonAction { sender in
            CartManager.shared.fetchCartDTO { data in
                let cartID = data.cartID
                let menuTitle = self.mockData.menuName
                let menuImage = "https://i.ibb.co/ydXz7jN/menu.png"
                let totalPrice = self.singleMenuPrice*self.totalMenuCount
                let menuCount = self.totalMenuCount
                let options = "데이터연결 아직안함"
                OrderDetailManager.shared.appendMenuInCart(cartID: cartID, menuName: menuTitle, menuImage: menuImage, totalPrice: totalPrice, options: options, totalCount: menuCount) { isCompleted in
                    if isCompleted {
                        let cartViewController = CartViewController()
                        self.navigationController?.pushViewController(cartViewController, animated: true)
                    }
                }
            }
        }
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
        self.navigationBar.config(menuName: mockData.menuName)

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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y <= 260 {
            self.navigationBar.layer.opacity = Float((-1.0/80.0)*(scrollView.contentOffset.y)+(13.0/4.0))
            self.navigationBar.menuName.isHidden = true
            self.navigationBar.buttonTintColor = .designSystem(.white)
            self.navigationBarBackGroundView.layer.opacity = 0
            self.navigationController?.navigationBar.barStyle = .black
        } else {
            self.navigationBar.menuName.isHidden = false
            self.navigationBar.buttonTintColor = .designSystem(.black)
            self.navigationBar.layer.opacity = Float((1/20)*(scrollView.contentOffset.y)-13)
            self.navigationBarBackGroundView.layer.opacity = Float((1/40)*(scrollView.contentOffset.y)-6)
            self.navigationController?.navigationBar.barStyle = .default
        }
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
