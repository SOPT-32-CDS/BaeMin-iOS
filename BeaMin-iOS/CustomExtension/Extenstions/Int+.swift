//
//  Int+.swift
//  CustomExtension
//
//  Created by uiskim on 2023/05/16.
//

import Foundation

extension Int {
    /// int를 넣어서 3자리마다 ","를 넣어주는 string으로 반환해주는 함수
    /// - Returns: "원"이 붙어서 return되는 string
    public func makePriceLabelFromNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))!+"원"
    }
}
