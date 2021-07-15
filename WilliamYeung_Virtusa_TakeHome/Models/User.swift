//
//  Users.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import Foundation

struct User: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
}
