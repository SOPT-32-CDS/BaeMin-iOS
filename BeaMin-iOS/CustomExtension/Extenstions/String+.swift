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
