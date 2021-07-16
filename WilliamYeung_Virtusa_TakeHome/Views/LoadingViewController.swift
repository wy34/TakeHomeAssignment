//
//  LoadingViewController.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

class LoadingViewController: UIViewController {
    // MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Helpers
    func showLoadingSpinner() {
        view.addSubview(containerView)
        containerView.fillSuperView(view)
        
        containerView.addSubview(loadingSpinner)
        loadingSpinner.center(x: containerView.centerXAnchor, y: containerView.centerYAnchor, yPadding: -50)
    }
    
    func dismissLoadingSpinner() {
        containerView.removeFromSuperview()
        loadingSpinner.stopAnimating()
    }
}
