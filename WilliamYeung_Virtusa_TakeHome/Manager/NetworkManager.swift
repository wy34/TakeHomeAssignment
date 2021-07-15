//
//  NetworkManager.swift
//  WilliamYeung_Virtusa_TakeHome
//
//  Created by William Yeung on 7/15/21.
//

import Foundation


class NetworkManager {
    // MARK: - Properties
    static let shared = NetworkManager()
    private let urlString = "https://jsonplaceholder.typicode.com/users"
    
    // MARK: - Helpers
    func fetchUserDetails(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let _ = error {
                    completion(.failure(.unableToComplete))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                if let data = data {
                    do {
                        let users = try JSONDecoder().decode([User].self, from: data)
                        completion(.success(users))
                    } catch {
                        completion(.failure(.unableToParse))
                        return
                    }
                }
            }
            .resume()
        }
    }
}
