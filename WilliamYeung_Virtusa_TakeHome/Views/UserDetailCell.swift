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
            
            let userVM = UserViewModel(user: user)
            name.text = userVM.fullName
            userName.text = userVM.userName
            email.text = userVM.email
            address.text = userVM.address
        }
    }
    
    // MARK: - Views
    private let nameLabel = CustomLabel(text: "Full Name:", font: .systemFont(ofSize: 18, weight: .black))
    private let name = CustomLabel(text: "")
    private lazy var displayNameStackView = CustomStackView(views: [nameLabel, name], axis: .vertical, distribution: .fillEqually, alignment: .fill)

    private let usernameLabel = CustomLabel(text: "Username:", font: .systemFont(ofSize: 18, weight: .black))
    private let userName = CustomLabel(text: "")
    private lazy var usernameStackView = CustomStackView(views: [usernameLabel, userName], axis: .vertical, distribution: .fillEqually, alignment: .fill)

    private let emailLabel = CustomLabel(text: "Email:", font: .systemFont(ofSize: 18, weight: .black))
    private let email = CustomLabel(text: "")
    private lazy var emailStackView = CustomStackView(views: [emailLabel, email], axis: .vertical, distribution: .fillEqually, alignment: .fill)

    private let addressLabel = CustomLabel(text: "Address:", font: .systemFont(ofSize: 18, weight: .black))
    private let address = CustomLabel(text: "")
    private lazy var addressStackView = CustomStackView(views: [addressLabel, address], axis: .vertical, distribution: .fillProportionally, alignment: .fill)

    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [displayNameStackView, usernameStackView, emailStackView, addressStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fill
        return stack
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configureUI() {
        address.numberOfLines = 2
    }
    
    private func layoutUI() {
        addSubview(labelStackView)

        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
}
