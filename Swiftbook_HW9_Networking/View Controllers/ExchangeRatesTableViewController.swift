//
//  ExchangeRatesTableViewController.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 26.09.2021.
//

import UIKit

class ExchangeRatesTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    var exchangeRates: ExchangeRates?
    let list = ["USD", "EUR", "CHF", "GBP", "JPY"]
    let url = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetch(dataType: ExchangeRates.self, from: url) { result in
            switch result {
            case .success(let exchangeRates):
                self.exchangeRates = exchangeRates
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = list[indexPath.row]
        
        if let rate = exchangeRates?.valute?[list[indexPath.row]]?.value {
            content.secondaryText = String(rate)
        } else {
            content.secondaryText = "No data"
        }
        cell.contentConfiguration = content
        
        return cell
    }
}
