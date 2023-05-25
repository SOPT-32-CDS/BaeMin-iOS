//
//  OrderCompleteViewController.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/25.
//  Copyright (c) 2023 OrderComplete. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class OrderCompleteViewController: UIViewController {
    
    private let orderComoleteImageView: UIImageView = {
        let imageView = UIImageView(image: .assetImage(.OrderCompleteImage))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let completeLabel: UILabel = {
        let label = UILabel()
        label.text = "주문이 완료되었습니다!"
        label.font = .pretendard(.title)
        label.textAlignment = .center
        label.textColor = .designSystem(.black)
        return label
    }()
    
    private let completeButton = BMBasicButton(title: "홈으로 돌아가기")

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

private extension OrderCompleteViewController {
    func setUI() {
        view.backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        view.addSubviews(orderComoleteImageView, completeLabel, completeButton)
    }
    
    func setLayout() {
        orderComoleteImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(331)
            make.leading.trailing.equalToSuperview().inset(110)
        }
        
        completeLabel.snp.makeConstraints { make in
            make.top.equalTo(orderComoleteImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.leading.trailing.equalToSuperview().inset(11)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
