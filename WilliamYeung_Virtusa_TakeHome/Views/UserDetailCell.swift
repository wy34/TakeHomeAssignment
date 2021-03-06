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
    private let nameLabel = CustomLabel(text: "Full Name:", font: .systemFont(ofSize: 14, weight: .bold))
    private let name = CustomLabel(text: "", font: .systemFont(ofSize: 16, weight: .bold))
    private lazy var nameStackView = CustomStackView(views: [nameLabel, name], axis: .vertical, distribution: .fill, alignment: .fill)

    private let usernameLabel = CustomLabel(text: "Username:", font: .systemFont(ofSize: 14, weight: .bold))
    private let userName = CustomLabel(text: "", font: .systemFont(ofSize: 16, weight: .bold))
    private lazy var usernameStackView = CustomStackView(views: [usernameLabel, userName], axis: .vertical, distribution: .fill, alignment: .fill)

    private let emailLabel = CustomLabel(text: "Email:", font: .systemFont(ofSize: 14, weight: .bold))
    private let email = CustomLabel(text: "", font: .systemFont(ofSize: 16, weight: .bold))
    private lazy var emailStackView = CustomStackView(views: [emailLabel, email], axis: .vertical, distribution: .fill, alignment: .fill)

    private let addressLabel = CustomLabel(text: "Address:", font: .systemFont(ofSize: 14, weight: .bold))
    private let address = CustomLabel(text: "", font: .systemFont(ofSize: 16, weight: .bold))
    private lazy var addressStackView = CustomStackView(views: [addressLabel, address], axis: .vertical, distribution: .fill, alignment: .fill)

    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameStackView, usernameStackView, emailStackView, addressStackView])
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
        [nameLabel, usernameLabel, emailLabel, addressLabel].forEach({ $0.textColor = .systemGray2 })
        [nameStackView, usernameStackView, emailStackView].forEach({ $0.addBorder(side: .bottom, bgColor: .separator, dimension: 0.5) })
    }
    
    private func layoutUI() {
        addSubview(labelStackView)
        labelStackView.anchor(
            top: topAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            paddingTop: 20,
            paddingTrailing: 20,
            paddingBottom: 20,
            paddingLeading: 20
        )
    }
}
