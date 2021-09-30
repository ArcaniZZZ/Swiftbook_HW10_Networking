//
//  TrumpViewController.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 25.09.2021.
//

import UIKit
import Alamofire

class TrumpViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var quoteTextField: UILabel!
    
    // MARK: - Overriden functions
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteTextField.text = "Waiting for Mr. Trump"
    }
    
    // MARK: IB Actions
    @IBAction func askTrumpButtonPressed() {
        let link = "https://api.whatdoestrumpthink.com/api/v1/quotes/personalized?q=\(nameTextField.text ?? "")"
        
        AF.request(link).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let quote):
                guard let trumpsQuote = TrumpsQuote.getQuote(from: quote) else { return }
                self.getPersonalizedQuote(quote: trumpsQuote)
            case .failure(let error):
                print(error)
            }
            }
    }
            
            
            //        NetworkManager.shared.fetch(dataType: TrumpsQuote.self, from: link) { result in
            //            switch result {
            //            case .success(let trumpsQuote):
            //                self.getPersonalizedQuote(quote: trumpsQuote)
            //            case .failure(let error):
            //                print(error)
            //            }
            //        }
        
        // MARK: - Private Methods
        private func getPersonalizedQuote(quote: TrumpsQuote) {
            quoteTextField.text = quote.message
        }
    }

