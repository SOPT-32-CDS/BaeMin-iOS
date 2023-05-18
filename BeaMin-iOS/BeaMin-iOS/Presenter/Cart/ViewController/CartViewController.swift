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
    
    private let cartData = CartModel.cartDummy
    
    private let cartTableView = UITableView(frame: .zero, style: .grouped)
    
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
        cartTableView.sectionFooterHeight = 0
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
}
