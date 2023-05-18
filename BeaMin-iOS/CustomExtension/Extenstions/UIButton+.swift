//
//  UIButton+.swift
//  CustomExtension
//
//  Created by 고아라 on 2023/05/18.
//

import UIKit

extension UIButton {
    
    /// UIButton title을 vertical로 정렬할 수 있는 함수
    /// - Parameter spacing: image와 title 사이의 간격을 의미함
    public func alignTextBelow(spacing: CGFloat = 4.0) {
        guard let image = self.imageView?.image else {
            return
        }
        
        guard let titleLabel = self.titleLabel else {
            return
        }
        
        guard let titleText = titleLabel.text else {
            return
        }
        
        let titleSize = titleText.size(withAttributes: [
            NSAttributedString.Key.font: titleLabel.font as Any
        ])
        
        titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
        imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
    }
} 
