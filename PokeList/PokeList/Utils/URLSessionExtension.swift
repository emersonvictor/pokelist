//
//  URLSessionExtension.swift
//  PokeList
//
//  Created by Emerson Victor on 03/10/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { (data, response, error) in
            
            // Error case
            if let error = error {
                result(.failure(error))
                return
            }
            
            // Empty case
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            
            // Success case
            result(.success((response, data)))
        }
    }
}
