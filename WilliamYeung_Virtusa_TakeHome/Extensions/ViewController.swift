//
//  ViewController.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

extension UIViewController {
    /// Shortcut method to display a simple alert popup in a ViewController class
    ///
    /// - Parameters:
    ///     - title: The title of the popup alert
    ///     - message: The message of the popup alert
    func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
