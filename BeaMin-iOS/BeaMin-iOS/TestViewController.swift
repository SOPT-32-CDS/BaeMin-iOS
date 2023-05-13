//
//  TestViewController.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

import SnapKit
import Then

import DesignSystem

class TestViewController: UIViewController {
    
    let test: UILabel = {
        let label = UILabel()
        label.text = "테스트 텍스트입니다"
        label.font = .pretendard(.title)
        label.textColor = .designSystem(.white)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .designSystem(.mainGreen)
        view.addSubview(test)
        test.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }


}

