//
//  CurrencyRate.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 26.09.2021.
//

import Foundation

struct ExchangeRates: Codable {
    let valute: [String: Currency]?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
        case date = "Date"
    }
}

struct Currency: Codable {
    let value: Double?
    let previous: Double?
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case previous = "Previous"
    }
}
