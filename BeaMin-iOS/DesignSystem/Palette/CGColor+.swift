//
//  CGColor+.swift
//  DesignSystem
//
//  Created by uiskim on 2023/05/13.
//

import UIKit

extension CGColor {
    public class func designSystem(_ color: Palette) -> CGColor? {
        UIColor(named: color.rawValue)?.cgColor
    }
}
