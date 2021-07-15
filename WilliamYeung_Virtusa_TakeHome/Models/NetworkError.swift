//
//  NetworkError.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import Foundation

enum NetworkError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case unableToParse = "Unable to fetch data from the server. Please try again"
}
