//
//  CartStoreMenuTableViewCell.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/18.
//  Copyright (c) 2023 CartStoreMenu. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CartStoreMenuTableViewCell: UITableViewCell, TableViewCellReuseProtocol {
    
//    var menuData: Cart.Menu? {
//        didSet {
//            guard let menuData else { return }
//        }
//    }
    
    private let menuNameLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        label.text = "[갓성비]모둠초밥"
        return label
    }()
    
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = .assetImage(.menu13)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let singlePricePerMenuLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body2Bold)
        label.textColor = .designSystem(.gray1)
        label.text = "가격 : 11,000원"
        return label
    }()
    
    private let sideInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body2Bold)
        label.textColor = .designSystem(.gray1)
        label.text = "사이드 추가선택 : 7,000원"
        return label
    }()
    
    private let totalPricePerMenuLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.h3Headline)
        label.textColor = .designSystem(.black)
        label.text = 36000.makePriceLabelFromNumber()
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.homeButton), for: .normal)
        return button
    }()
    
    private let optionChangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("옵션변경", for: .normal)
        button.titleLabel?.font = .pretendard(.bady2)
        button.tintColor = .designSystem(.black)
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = .designSystem(.gray2)
        return button
    }()
    
    private let menuStepper = CartStepperView()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CartStoreMenuTableViewCell {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        contentView.addSubviews(menuNameLabel, singlePricePerMenuLabel, menuImageView, sideInfoLabel, totalPricePerMenuLabel, deleteButton, optionChangeButton, menuStepper)
    }
    
    func setLayout() {
        menuNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(15)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.trailing.equalToSuperview().inset(15)
            make.size.equalTo(22)
        }
        
        menuImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalTo(menuNameLabel.snp.bottom).offset(15)
            make.size.equalTo(72)
        }
        
        singlePricePerMenuLabel.snp.makeConstraints { make in
            make.top.equalTo(menuNameLabel.snp.bottom).offset(17)
            make.leading.equalTo(menuImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(64)
        }
        
        sideInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(singlePricePerMenuLabel.snp.bottom).offset(2)
            make.leading.equalTo(menuImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(64)
        }
        
        totalPricePerMenuLabel.snp.makeConstraints { make in
            make.top.equalTo(sideInfoLabel.snp.bottom).offset(12)
            make.leading.equalTo(menuImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(64)
            make.bottom.equalTo(menuImageView.snp.bottom)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.centerY.equalTo(menuNameLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
            make.size.equalTo(22)
        }
        
        menuStepper.snp.makeConstraints { make in
            make.top.equalTo(menuImageView.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.width.equalTo(90)
            make.height.equalTo(36)
        }
        
        optionChangeButton.snp.makeConstraints { make in
            make.trailing.equalTo(menuStepper.snp.leading).offset(-10)
            make.top.equalTo(menuStepper.snp.top)
            make.height.equalTo(36)
            make.width.equalTo(74)
        }
    }
    
    func setAddTarget() {
        deleteButton.addButtonAction { sender in
            print("삭제버튼이 눌렸습니다")
        }
        
        optionChangeButton.addButtonAction { sender in
            print("옵션변경버튼이눌렸습니다")
        }
    }
    
    func setDelegate() {
        
    }
}
