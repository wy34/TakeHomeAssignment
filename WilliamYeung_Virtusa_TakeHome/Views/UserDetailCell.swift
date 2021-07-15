//
//  UserDetailCell.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

class UserDetailCell: UITableViewCell {
    // MARK: - Properties
    static let reuseId = "UserDetailCell"
    
    var user: User? {
        didSet {
            guard let user = user else { return }
            displayNameLabel.text = user.name
            userNameLabel.text = user.username
            emailLabel.text = user.email
            addressLabel.text = user.address.street
        }
    }
    
    // MARK: - Views
    private let displayNameLabel = CustomLabel(text: "William Yeung")
    private let userNameLabel = CustomLabel(text: "wy34")
    private let emailLabel = CustomLabel(text: "wyeung34@gmail.com")
    private let addressLabel = CustomLabel(text: "1415 Alvin Ave")
    
    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [displayNameLabel, userNameLabel, emailLabel, addressLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func layoutUI() {
        addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
