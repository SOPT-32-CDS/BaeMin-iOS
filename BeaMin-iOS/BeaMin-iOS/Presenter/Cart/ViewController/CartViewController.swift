//
//  CartViewController.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 Cart. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CartViewController: UIViewController {
    
    private var cartData = CartModel.cartDummy
    
    private let cartTableView = UITableView(frame: .zero, style: .grouped)
    private lazy var tableViewFooterView = CartInfoView(delivertTip: cartData.menusByStore.map{$0.minimumPriceForDelivery}.reduce(0, +),
                                                        totalPriceForPay: cartData.menusByStore.map{$0.cartMenus}.flatMap{$0}.map{$0.totalPricePerMenu}.reduce(0, +), frame: .init(x: 0, y: 0, width: Constant.Screen.width, height: 400))
    
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
        
        // MARK: - tableView설정
        setTableView()
        
        setNavigation()

    }
}

private extension CartViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        view.addSubviews(cartTableView)
    }
    
    func setLayout() {
        cartTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
    
    func setTableView() {
        CartStoreMenuTableViewCell.register(tableView: cartTableView)
        cartTableView.rowHeight = 196
        cartTableView.separatorStyle = .none
        cartTableView.sectionFooterHeight = 52

        cartTableView.tableFooterView = tableViewFooterView
    }
    
    func setNavigation() {
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension CartViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cartData.menusByStore.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.menusByStore[section].cartMenus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CartStoreMenuTableViewCell.dequeueReusableCell(tableView: tableView)
        cell.menuData = cartData.menusByStore[indexPath.section].cartMenus[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = CartStoreMenuSectionHeaderView()
        sectionHeaderView.configure(storeName: cartData.menusByStore[section].storeName, storeImage: cartData.menusByStore[section].storeImage)
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 74
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionFooterView = CartStoreMenuSectionFooterView()
        return sectionFooterView
    }
}

extension CartViewController: CartMenuCountDelegate {
    func deleteRow(sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: cartTableView)
        guard let indexPath = cartTableView.indexPathForRow(at: point) else { return }
        cartData.menusByStore[indexPath.section].cartMenus.remove(at: indexPath.row)
        cartTableView.beginUpdates()
        cartTableView.deleteRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .left)
        cartTableView.endUpdates()
        tableViewFooterView.updateCart = cartData.menusByStore.map{$0.cartMenus}.flatMap{$0}.map{$0.totalPricePerMenu}.reduce(0, +)
    }
    
    func priceChangeByMenuCount(singlePricePerMenu: Int) {
        tableViewFooterView.priceChangeAmount = singlePricePerMenu
    }
}
