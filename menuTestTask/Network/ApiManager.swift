//
//  ApiManager.swift
//  menuTestTask
//
//  Created by admin1 on 3.04.23.
//

import UIKit

final class APIManager {
    static let shared = APIManager()
    
    let urlString = "https://api.punkapi.com/v2/beers"
    
    func getData(complition: @escaping ([PivkoElement]) -> Void) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let beer = try? JSONDecoder().decode(Pivko.self, from: data){
                complition(beer)
            } else {
                print("fall")
            }
        }
        task.resume()
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
}
