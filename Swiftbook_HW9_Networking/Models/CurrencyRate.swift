//
//  CurrencyRate.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 26.09.2021.
//

import Foundation

// MARK: - Currency Details
struct CurrencyInfo: Codable {
    let Valute: [String: Valute]
}

// MARK: - Valute
struct Valute: Codable {
    let CharCode: String
    let Value: Double
    var valueString: String {
        String(format: "%0.2f", Value)
    }
}
