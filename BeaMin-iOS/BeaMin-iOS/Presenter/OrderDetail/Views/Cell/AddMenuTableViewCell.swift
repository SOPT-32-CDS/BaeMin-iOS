//
//  AddMenuTableViewCell.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/16.
//  Copyright (c) 2023 AddMenu. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

protocol priceDelegate: AnyObject {
    func priceChangeBySubMenu(isSelect: Bool, price: Int)
}

final class AddMenuTableViewCell: UITableViewCell, TableViewCellReuseProtocol {
    
    weak var delegate: priceDelegate?
    
    var data: Menu? {
        didSet {
            guard let data else { return }
            addMenuLabel.text = data.addMenuName
            priceLabel.text = "+" + data.addMenuPrice.makePriceLabelFromNumber()
            price = data.addMenuPrice
        }
    }
    
    private var price: Int = 0
    
    private let checkBox: UIButton = {
        let button = UIButton()
        button.setImage(.assetImage(.emptyCheckBox), for: .normal)
        button.setImage(.assetImage(.fillCheckBox), for: .selected)
        return button
    }()
    
    private let addMenuLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body1)
        label.textColor = .designSystem(.black)
        label.text = "새우튀김 6p 추가"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.body1)
        label.textColor = .designSystem(.black)
        label.text = "+13,000원"
        return label
    }()
    

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

private extension AddMenuTableViewCell {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        contentView.addSubviews(checkBox, addMenuLabel, priceLabel)

    }
    
    func setLayout() {
        checkBox.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(24)
            make.size.equalTo(24)
        }
        
        addMenuLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(checkBox.snp.trailing).offset(13)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    func setAddTarget() {
        checkBox.addButtonAction { sender in
            sender.isSelected = !sender.isSelected
            self.delegate?.priceChangeBySubMenu(isSelect: sender.isSelected, price: self.price)
        }
    }
    
    func setDelegate() {
        
    }
}
