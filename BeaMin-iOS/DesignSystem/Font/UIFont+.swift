//
//  UIFont+.swift
//  DesignSystem
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

extension UIFont {
    
    public class func pretendard(_ type: Font.PretendardType) -> UIFont {
        let font = Font.PretendardFont(name: .pretendard, weight: type.Wight)
        return ._font(name: font.name, size: type.Size)
    }
    
    public class func hannaPro(_ type: Font.HannaProType) -> UIFont {
        let font = Font.HannaProFont(_name: .bmHannaPro, _weight: type.Weight)
        return ._font(name: font.name, size: type.Size)
    }
    
    private static func _font(name: String, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name, size: size) else {
            return .systemFont(ofSize: size)
        }
        return font
    }
}
