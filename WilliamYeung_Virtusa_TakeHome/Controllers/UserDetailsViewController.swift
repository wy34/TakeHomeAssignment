//
//  UserDetailsViewController.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

class UserDetailsViewController: UIViewController {
    // MARK: - Properties
    var user: User? {
        didSet {
            guard let user = user else { return }
            navigationItem.title = "Leanne's Information"
        }
    }
    
    // MARK: - Views
        private let headingLabel = CustomLabel(text: "Information")
        private let userNameLabel = CustomLabel(text: "UserName: wy34")
        private let emailLabel = CustomLabel(text: "Email: wyeung34@gmail.com")
        private let addressLabel = CustomLabel(text: "Address: 1415 Alvin Ave")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func layoutUI() {
        view.addSubview(headingLabel)
        
        
    }
}
