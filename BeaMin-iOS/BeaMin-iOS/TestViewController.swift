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
import CustomExtension

class TestViewController: UIViewController {
    
    let testChip = ChoiceChipView()
    
    var intArray = [1,2,3,4]
    
    let taifhiashfiashfishfihsafho_fjosfjosjf_siofjsofiest: UILabel = {
        let label = UILabel()
        label.text = "테스트 텍스트입니다"
        label.font = .hannaPro(.brandTypeBig)
        label.textColor = .designSystem(.white)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .designSystem(.mainGreen)
        view.addSubview(taifhiashfiashfishfihsafho_fjosfjosjf_siofjsofiest)
        taifhiashfiashfishfihsafho_fjosfjosjf_siofjsofiest.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
        
        view.addSubview(testChip)
        testChip.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        if intArray.isEmpty {
            print("린트걸릴겁니다")
        }
    }
}
