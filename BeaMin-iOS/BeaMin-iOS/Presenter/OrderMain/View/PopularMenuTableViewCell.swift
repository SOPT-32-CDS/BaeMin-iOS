//
//  PopularMenuTableViewCell.swift
//  BeaMin-iOS
//
//  Created by 남유진 on 2023/05/17.
//  Copyright (c) 2023 PopularMenu. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class PopularMenuTableViewCell: UITableViewCell, TableViewCellReuseProtocol {
    
    static let identifier = "PopularMenuCell"
    
    var data: OrderMenu? {
        didSet {
            guard let data else { return }
            menuName.text = data.menuName
            menuContent.text = data.menuContent
        }
    }
    
    private let popularTag = UIImageView(image: .assetImage(.popularTag))
    
    private let menuName = UILabel().then {
        $0.text = "[재주문 1위] 특초밥+미니우동"
        $0.font = .pretendard(.h3Headline)
        $0.textColor = .designSystem(.black)
    }
    
    private let menuContent = UILabel().then {
        $0.text = "흰살생선3p, 연어 2p, 참치1p, 황새치 1p,\n초새우1p, 간장새우1p, 생새우1p, 소..."
        $0.numberOfLines = 2
        $0.font = .pretendard(.body2)
        $0.textColor = .designSystem(.gray1)
    }
    
    private let menuImage = UIImageView().then {
        $0.image = .assetImage(.sushi)
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
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

private extension PopularMenuTableViewCell {
    func setUI() {
        backgroundColor = .designSystem(.white)
    }
    
    func setHierarchy() {
        contentView.addSubviews(popularTag, menuName, menuContent, menuImage)
    }
    
    func setLayout() {
        popularTag.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(18)
            $0.top.equalToSuperview().inset(10)
            $0.width.height.equalTo(34)
        }
        
        menuName.snp.makeConstraints {
            $0.leading.equalTo(popularTag.snp.trailing)
            $0.trailing.equalTo(menuImage.snp.leading)
            $0.top.equalTo(popularTag.snp.top).inset(6)
        }
        
        menuContent.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(183)
            $0.top.equalTo(popularTag.snp.bottom).offset(8)
        }
        
        menuImage.snp.makeConstraints {
            $0.width.height.equalTo(120)
            $0.top.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    
    func setAddTarget() {
        
    }
    
    func setDelegate() {
        
    }
}
