//
//  CheckBox.swift
//  BeaMin-iOS
//
//  Created by uiskim on 2023/05/16.
//  Copyright (c) 2023 CheckBox. All rights reserved.
//

import UIKit

import SnapKit
import Then

import CustomExtension
import DesignSystem

final class CheckBox: UIControl {
    
    var dataSender: ((Bool)->Void)?
    
    private let checkImageView: UIImageView = {
        let imageView = UIImageView(image: .assetImage(.emptyCheckBox))
        return imageView
    }()
    
    private var image: UIImage {
        return checked ? .assetImage(.fillCheckBox)! : .assetImage(.emptyCheckBox)!
    }
    
    private var checked: Bool = false {
        didSet {
            checkImageView.image = image
            guard let dataSender else { return }
            dataSender(checked)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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

private extension CheckBox {
    
    func setHierarchy() {
        addSubviews(checkImageView)
    }
    
    func setLayout() {
        checkImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        addButtonAction { _ in
            self.checked = !self.checked
        }
    }
    
    func setDelegate() {
        
    }
}
