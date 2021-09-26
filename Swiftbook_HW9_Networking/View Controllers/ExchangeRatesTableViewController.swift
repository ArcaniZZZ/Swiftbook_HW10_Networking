//
//  ExchangeRatesTableViewController.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 26.09.2021.
//

import UIKit

class ExchangeRatesTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    var currencies: [String: Valute] = [:]
    var currencyData: CurrencyInfo!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurrency()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        let currency = CurrencyList.list[indexPath.row]
        cell.configure(with: currencyData, for: currency)
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func fetchCurrency() {
        guard let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            do {
                self.currencyData = try JSONDecoder().decode(CurrencyInfo.self, from: data)
                print("Success")
                DispatchQueue.main.async {
                    self.currencies = self.currencyData.Valute
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


extension ExchangeRatesTableViewController: CurrencySettingsViewControllerDelegate {
    func addCurrency(currency: String) {
        CurrencyList.list.append(currency)
        tableView.reloadData()
    }
}
