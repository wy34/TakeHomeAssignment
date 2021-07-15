//
//  String.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import Foundation

extension String {
    func withoutPrefix() -> String {
        let lowerCased = self.lowercased()
        
        if lowerCased.hasPrefix("mr. ") {
            return lowerCased.dropFirst("mr. ".count).capitalized
        } else if lowerCased.hasPrefix("mrs. ") {
            return lowerCased.dropFirst("mrs. ".count).capitalized
        }

        return self
    }
}
