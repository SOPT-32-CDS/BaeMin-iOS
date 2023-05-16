//
//  String+.swift
//  CustomExtension
//
//  Created by uiskim on 2023/05/13.
//

import Foundation

extension String {
    /// !isNotEmpty대신 쓰는 계산속성
    public var isNotEmpty: Bool {
        return self.isEmpty ? false : true
    }
}

extension String {
    /// int를 넣어서 3자리마다 ","를 넣어주는 string으로 반환해주는 함수
    /// - Parameter price: 가격
    /// - Returns: "원"이 붙어서 return되는 string
    public func makePriceLabelFromNumber(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: price))!+"원"
    }
}
