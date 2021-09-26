//
//  CurrencyCell.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 26.09.2021.
//

import UIKit

class CurrencyCell: UITableViewCell {
    @IBOutlet var currencyName: UILabel!
    @IBOutlet var currencyRate: UILabel!
    
    func configure(with currencyData: CurrencyInfo, for currency: String) {
        currencyName.text = currencyData.Valute[currency]?.CharCode ?? ""
        currencyRate.text = currencyData.Valute[currency]?.valueString ?? ""
    }
}
