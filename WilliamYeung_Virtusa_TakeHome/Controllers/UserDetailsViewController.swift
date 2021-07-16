//
//  UserDetailsViewController.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

class UserDetailsViewController: UIViewController {
    // MARK: - Properties
    var user: User?
    
    // MARK: - Views
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.register(UserDetailCell.self, forCellReuseIdentifier: UserDetailCell.reuseId)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.tableFooterView = UIView()
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureUI()
        layoutUI()
    }
    
    // MARK: - Helpers
    private func configureNavBar() {
        if let user = user {
            let userVM = UserViewModel(user: user)
            navigationItem.title = userVM.firstName + "'s Details"
        }
        
        navigationController?.view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func layoutUI() {
        view.addSubview(tableView)
        tableView.fillSuperView(view)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailCell.reuseId, for: indexPath) as? UserDetailCell {
            cell.user = user
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
