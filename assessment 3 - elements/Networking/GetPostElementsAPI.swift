//
//  GetElementsAPI.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/15/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import Foundation

 struct GetPostElementsAPI {
    
    private init() {}
    static let manager = GetPostElementsAPI()
    
    func fetchElementsJson(completion: @escaping (Result<[Element], AppError>) -> Void) {
        let jsonUrlString = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        guard let url = URL(string: jsonUrlString) else {return}
        let request = URLRequest(url:url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let elements = try JSONDecoder().decode([Element].self, from: data)
                    completion(.success(elements))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    func postElement(element: PostedElement, completion: @escaping (Result<Bool,AppError>) -> Void) {
        let publishEndpointURL = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        guard let url = URL(string: publishEndpointURL) else {
            completion(.failure(.badURL(publishEndpointURL)))
            return
        }
        do {
            let data = try JSONEncoder().encode(element)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            NetworkHelper.shared.performDataTask(with: request) { (result) in
                switch result {
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success:
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(.encodingError(error)))
        }
    }
    
    func fetchPostedElementsJson(completion: @escaping (Result<[PostedElement], AppError>) -> Void) {
           let jsonUrlString = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
           guard let url = URL(string: jsonUrlString) else {return}
           let request = URLRequest(url:url)
           NetworkHelper.shared.performDataTask(with: request) { (result) in
               switch result {
               case .failure(let appError):
                   completion(.failure(.networkClientError(appError)))
               case .success(let data):
                   do {
                       let elements = try JSONDecoder().decode([PostedElement].self, from: data)
                       completion(.success(elements))
                   } catch {
                       completion(.failure(.decodingError(error)))
                   }
               }
           }
       }
}

        
    

