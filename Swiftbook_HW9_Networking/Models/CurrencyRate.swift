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
    
    init(currencyInfo: [String: Any]) {
        valute = currencyInfo["Valute"] as? [String: Currency]
        date = currencyInfo["Date"] as? String
    }
    
    static func getCurrency(from value: Any) -> ExchangeRates? {
        guard let exchangeRates = value as? [String: Any] else { return nil }
        return ExchangeRates(currencyInfo: exchangeRates)
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
