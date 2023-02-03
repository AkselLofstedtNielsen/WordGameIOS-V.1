//
//  Extension.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-03.
//

import Foundation

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
