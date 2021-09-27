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
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurrency()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = list[indexPath.row]
        if let rate = exchangeRates?.Valute[list[indexPath.row]]?.Value {
            content.secondaryText = String(rate)
        } else {
            content.text = "No data"
        }
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Private Properties
    private func fetchCurrency() {
        guard let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            do {
                self.exchangeRates = try JSONDecoder().decode(ExchangeRates.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
