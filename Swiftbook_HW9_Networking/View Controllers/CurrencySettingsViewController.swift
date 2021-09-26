//
//  CurrencySettingsViewController.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 26.09.2021.
//

import UIKit
 
protocol CurrencySettingsViewControllerDelegate {
    func addCurrency(currency: String)
}

class CurrencySettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentationController?.delegate = self

    }
    

}

extension CurrencySettingsViewController: UIAdaptivePresentationControllerDelegate {
    
}
