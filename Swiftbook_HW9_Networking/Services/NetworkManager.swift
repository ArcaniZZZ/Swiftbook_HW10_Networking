//
//  NetworkManager.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 29.09.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    enum ErrorType: Error {
        case invalidURL
        case noData
        case decodingError
    }
    
    static let shared = NetworkManager()
    
    func fetch<T: Codable>(dataType: T.Type, from url: String, completion: @escaping(Result<T, ErrorType>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    private init() {}
}
