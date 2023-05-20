//
//  OrderMainHeaderViewController.swift
//  BeaMin-iOS
//
//  Created by 남유진 on 2023/05/19.
//  Copyright (c) 2023 OrderMainHeader. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderMainHeaderViewController: UIViewController {
    
    let testView = OrderMainView()

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

private extension OrderMainHeaderViewController {
    func setUI() {
        
    }
    
    func setHierarchy() {
        view.addSubview(testView)
    }
    
    func setLayout() {
        testView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(700)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
