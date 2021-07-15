//
//  UserViewModel.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import UIKit

struct UserViewModel {
    // MARK: - Properties
    var user: User
    
    var firstName: String {
        let withoutPrefix = user.name.withoutPrefix()
        return withoutPrefix.components(separatedBy: " ").first ?? ""
    }
    
    var fullName: String {
        return user.name
    }
    
    var userName: String {
        return user.username
    }
    
    var email: String {
        return user.email
    }
    
    var address: String {
        return "\(user.address.street), \(user.address.suite), \(user.address.city), \(user.address.zipcode)"
    }
    
    // MARK: - Init
    init(user: User) {
        self.user = user
    }
    
    // MARK: - Helper
    
}
