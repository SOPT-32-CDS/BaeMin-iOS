//
//  HomViewController.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

class HomViewController: UIViewController {
    let tabBarView = CustomTabBar(tabBarItems: [.find, .heart, .logo, .order, .mypage])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tabBarView)
        
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.layer.cornerRadius = 16
        tabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        NSLayoutConstraint.activate([
            tabBarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabBarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 83),
            tabBarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
        
    }
}
