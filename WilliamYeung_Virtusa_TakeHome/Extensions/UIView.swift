//
//  UIView.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

extension UIView {
    /// Positions the view to take up the entire space of a superview
    ///
    /// - Parameters:
    ///     - superview: The view that the current view should fill up in
    func fillSuperView(_ superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor)
        ])
    }
}
