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
    
    /// Positions the view in relation to a superview
    ///
    /// - Parameters:
    ///     - top: The top side of superview the current view should be in relationship with
    ///     - trailing: The trailing side of superview the current view should be in relationship with
    ///     - bottom: The bottom side of superview the current view should be in relationship with
    ///     - leading: The leading side of superview the current view should be in relationship with
    ///     - paddingTop: Padding away from the top side
    ///     - paddingTrailing: Padding away from the trailing side
    ///     - paddingBottom: Padding away from the bottom side
    ///     - paddingLeading: Padding away from the leading side
    func anchor(top: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, paddingTop:  CGFloat = 0, paddingTrailing: CGFloat = 0, paddingBottom: CGFloat = 0, paddingLeading: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
    }
    
    /// Centers the view in relation to a superview
    ///
    /// - Parameters:
    ///     - x: The horizontal centering anchor of superview.
    ///     - y: The vertical centering anchor of superview.
    ///     - xPadding: Horizontal padding from center x.
    ///     - yPadding: Vertical padding from center y.
    func center(x: NSLayoutXAxisAnchor? = nil, y: NSLayoutYAxisAnchor? = nil, xPadding: CGFloat = 0, yPadding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let x = x {
            centerXAnchor.constraint(equalTo: x, constant: xPadding).isActive = true
        }
        
        if let y = y {
            centerYAnchor.constraint(equalTo: y, constant: yPadding).isActive = true
        }
    }
}
