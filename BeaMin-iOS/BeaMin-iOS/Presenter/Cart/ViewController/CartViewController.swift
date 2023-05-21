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
    
    private var cartData: CartModel = .init(menusByStore: [])
    private let BMnavigationBar = BMNavigationBar()
    private let cartTableView = UITableView(frame: .zero, style: .grouped)
    private lazy var tableViewFooterView = CartInfoView(delivertTip: cartData.totalDeliveryTip,
                                                        totalPrice: cartData.totalPrice,
                                                        frame: .init(x: 0, y: 0, width: Constant.Screen.width, height: 400))
    
    private lazy var cartButton = CartInfoButton(totalPrice: cartData.totalPrice + cartData.totalDeliveryTip, totalCount: cartData.totalMenuCount)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        // MARK: - 컴포넌트 설정
        setUI()
        
        // MARK: - addsubView
        setHierarchy()
        
        // MARK: - autolayout설정
        setLayout()
        
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
        print(cartData.totalMenuCount)
    }
    
    func setHierarchy() {
        view.addSubviews(cartTableView, BMnavigationBar, cartButton)
    }
    
    func setLayout() {
        cartTableView.snp.makeConstraints { make in
            make.top.equalTo(BMnavigationBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(cartButton.snp.top).offset(-12)
        }
        BMnavigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        cartButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview().inset(11.5)
        }

    }
    
    func setDelegate() {
        cartTableView.dataSource = self
        cartTableView.delegate = self
    }
    
    func setTableView() {
        CartStoreMenuTableViewCell.register(tableView: cartTableView)
        cartTableView.rowHeight = 196
        cartTableView.separatorStyle = .none
        cartTableView.sectionFooterHeight = 45
        cartTableView.tableFooterView = tableViewFooterView
    }
    
    func setNavigation() {
        self.navigationController?.navigationBar.isHidden = true
        BMnavigationBar.backgroundColor = .designSystem(.white)
        BMnavigationBar.buttonTintColor = .designSystem(.black)
    }
    
    func setData() {
        cartData = CartModel.cartDummy
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
        cell.selectionStyle = .none
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
    func changeCarMenuCount(sender: UIButton, count: Int, totalPrice: Int) {
        cartButton.totalCount += count
        let point = sender.convert(CGPoint.zero, to: cartTableView)
        guard let indexPath = cartTableView.indexPathForRow(at: point) else { return }
        print(indexPath)
        print(count)
        cartData.menusByStore[indexPath.section].cartMenus[indexPath.row].menuCount += count
        cartData.menusByStore[indexPath.section].cartMenus[indexPath.row].totalPricePerMenu = totalPrice
    }

    
    func deleteCartMenu(deleteCount: Int, price: Int) {
        cartButton.totalCount -= deleteCount
        tableViewFooterView.updatePriceByDeleteMenu = price
        cartButton.totalPrice -= price
    }

    
    func deleteRow(sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: cartTableView)
        guard let indexPath = cartTableView.indexPathForRow(at: point) else { return }
        cartData.menusByStore[indexPath.section].cartMenus.remove(at: indexPath.row)
        cartTableView.beginUpdates()
        cartTableView.deleteRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .left)
        cartTableView.endUpdates()
    }
    
    func priceChangeByMenuCount(singlePricePerMenu: Int) {
        tableViewFooterView.priceChangeAmount = singlePricePerMenu
        cartButton.changePrice = singlePricePerMenu
    }
}
