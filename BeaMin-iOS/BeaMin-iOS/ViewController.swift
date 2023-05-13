//
//  ViewController.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

import SnapKit
import Then

import DesignSystem

class ViewController: UIViewController {
    
    let test: UILabel = {
        let label = UILabel()
        label.text = "테스트 텍스트입니다"
        label.font = .pretendard(type: .body3)
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(test)
        test.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }


}

