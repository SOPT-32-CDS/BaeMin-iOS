//
//  UIView+.swift
//  CustomExtension
//
//  Created by uiskim on 2023/05/13.
//

import UIKit.UIView

extension UIView {
    /// addsubView를 편리하게 해주는 메서드
    /// - Parameter views: uiview를 상속받는 객체들을 넣어줌
    public func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

extension UIView {
    /// 해당View의 SafeArea Height를 반환해주는 계산속성
    public var safeAreaHeight: CGFloat {
        let verticalSafeAreaInset = self.safeAreaInsets.bottom + self.safeAreaInsets.top
        let safeAreaHeight = self.frame.height - verticalSafeAreaInset
        return safeAreaHeight
    }
}
