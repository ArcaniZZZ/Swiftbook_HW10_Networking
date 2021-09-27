//
//  CurrencyRate.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 26.09.2021.
//

import Foundation


struct ExchangeRates: Decodable {
    let Valute: [String: Valute]
}

struct Valute: Decodable {
    let Value: Double
}
