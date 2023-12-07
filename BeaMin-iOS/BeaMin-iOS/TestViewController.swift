//
//  TestViewController.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/13.
//

import CustomExtension
import DesignSystem
import SnapKit
import Then
import UIKit

class TestViewController: UIViewController {
    
    let testChip = ChoiceChipView()
    
    var intArray = [1,2,3,4]
    
    
    
    let sfsf: UILabel = {
        let label = UILabel()
        label.text = "테스트 텍스트입니다"
        label.font = .hannaPro(.brandTypeBig)
        label.textColor = .designSystem(.white)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .designSystem(.mainGreen)
        view.addSubview(sfsf)
        sfsf.snp.makeConstraints { make in
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
