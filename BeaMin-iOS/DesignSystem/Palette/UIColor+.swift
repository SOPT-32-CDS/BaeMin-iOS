//
//  UIColor+.swift
//  DesignSystem
//
//  Created by uiskim on 2023/05/13.
//

import Foundation

import UIKit

extension UIColor {
    public class func designSystem(_ color: Palette) -> UIColor? {
        UIColor(named: color.rawValue)
    }
}
