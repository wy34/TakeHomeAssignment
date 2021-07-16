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
    
    /// Adds a border to the specified side of a view
    ///
    /// - Parameters:
    ///     - side: The side that you want to add a border to (top, right, bottom, or left)
    ///     - bgColor: The color of the border
    ///     - dimension: The thickness of the border line
    func addBorder(side: Side, bgColor: UIColor, dimension: CGFloat) {
        let border = UIView()
        border.backgroundColor = bgColor
        border.translatesAutoresizingMaskIntoConstraints = false
        addSubview(border)
        
        let topConstraint = border.topAnchor.constraint(equalTo: topAnchor)
        let trailingConstraint = border.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottomConstraint = border.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 6)
        let leadingConstraint = border.leadingAnchor.constraint(equalTo: leadingAnchor)
        let widthConstraint = border.widthAnchor.constraint(equalToConstant: dimension)
        let heightConstraint = border.heightAnchor.constraint(equalToConstant: dimension)
        
        switch side {
            case .top:
                NSLayoutConstraint.activate([leadingConstraint, topConstraint, trailingConstraint, heightConstraint])
            case .right:
                NSLayoutConstraint.activate([topConstraint, trailingConstraint, bottomConstraint, widthConstraint])
            case .bottom:
                NSLayoutConstraint.activate([leadingConstraint, bottomConstraint, trailingConstraint, heightConstraint])
            case .left:
                NSLayoutConstraint.activate([topConstraint, leadingConstraint, bottomConstraint, widthConstraint])
        }
    }
}



