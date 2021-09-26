//
//  TrumpViewController.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 25.09.2021.
//

import UIKit

class TrumpViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var quoteTextField: UILabel!
    
    // MARK: - Private Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteTextField.text = "Waiting for Mr. Trump"
    }
    
    //MARK: IB Actions
    @IBAction func askTrumpButtonPressed() {
        getPersonalizedQuote()
    }
    
    //MARK: - Private Methods
    private func getPersonalizedQuote() {
        let link = "https://api.whatdoestrumpthink.com/api/v1/quotes/personalized?q=\(nameTextField.text ?? "")"
        guard let url = URL(string: link ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let quote = try JSONDecoder().decode(TrumpsQuote.self, from: data)
                DispatchQueue.main.async {
                    self.quoteTextField.text = quote.message
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
