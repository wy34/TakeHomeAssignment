//
//  ViewController.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

class UsersViewController: LoadingViewController {
    // MARK: - Properties
    private let reuseId = "UsersViewControllerCell"
    var users = [User]()
    
    // MARK: - Views
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableFooterView = UIView()
        return tv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        layoutUI()
        fetchUsers()
    }

    // MARK: - Helpers
    private func configureNavBar() {
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func layoutUI() {
        view.addSubview(tableView)
        tableView.fillSuperView(view)
    }
    
    private func fetchUsers() {
        showLoadingSpinner()
        
        NetworkManager.shared.fetchUserDetails { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let users):
                        self.dismissLoadingSpinner()
                        self.users = users
                        self.tableView.reloadData()
                    case .failure(let error):
                        self.dismissLoadingSpinner()
                        self.showAlert(withTitle: "Error", message: error.rawValue)
                }
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let userDetailsVC = UserDetailsViewController()
        userDetailsVC.user = user
        navigationController?.pushViewController(userDetailsVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let noUsersLabel = CustomLabel(text: "No Users...", font: .systemFont(ofSize: 16, weight: .bold))
        noUsersLabel.textAlignment = .center
        return noUsersLabel
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return users.isEmpty ? 250 : 0
    }
}
