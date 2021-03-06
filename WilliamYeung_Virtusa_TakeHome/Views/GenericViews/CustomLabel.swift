//
//  CustomLabel.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

class CustomLabel: UILabel {
    // MARK: - Init
    init(text: String, font: UIFont? = nil) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
