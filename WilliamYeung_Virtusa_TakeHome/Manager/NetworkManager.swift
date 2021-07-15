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
    func fetchUserDetails(completion: @escaping (Result<[User], Error>) -> Void) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                        let users = try JSONDecoder().decode([User].self, from: data)
                        completion(.success(users))
                    } catch {
                        completion(.failure(error))
                        return
                    }
                }
            }
            .resume()
        }
    }
}
