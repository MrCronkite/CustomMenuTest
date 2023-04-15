//
//  ApiManager.swift
//  menuTestTask
//
//  Created by admin1 on 3.04.23.
//

import UIKit

protocol NetworkServicesBeer {
    func getBeerData (complition: @escaping (Result<Pivko, Error>) -> Void)
    
}

enum Errors: Error {
    case invalidURL
    case invalideState
}

final class NetworkServicesBeerImpl: NetworkServicesBeer {
    private enum API {
        static let beers = "https://api.punkapi.com/v2/beers"
    }
    
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .init()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }
    
    func getBeerData(complition: @escaping(Result<Pivko, Error>) -> Void) {
        guard let url = URL(string: API.beers) else {
            complition(.failure(Errors.invalidURL))
            return
        }
        
        let request = urlSession.dataTask(with: url) { [jsonDecoder] data, response, error in
            switch (data, error) {
            case let (.some(data), nil):
                do {
                    let beer = try jsonDecoder.decode(Pivko.self, from: data)
                    complition(.success(beer))
                } catch {
                    complition(.failure(Errors.invalideState))
                }
            case let (nil, .some(error)):
                complition(.failure(error))
            default: complition(.failure(Errors.invalideState))
            }
        }
        request.resume()
    }
}


func asyncLoadImage(imageURL: URL,
                    completion: @escaping (UIImage?, Error?) -> ()) {
    DispatchQueue.global().async {
        do {
            let data = try Data(contentsOf: imageURL)
            DispatchQueue.main.async { completion(UIImage(data: data), nil)}
        } catch let error {
            DispatchQueue.main.async { completion(nil, error)}
        }
    }
}

