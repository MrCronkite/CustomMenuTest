//
//  ApiManager.swift
//  menuTestTask
//
//  Created by admin1 on 3.04.23.
//

import Foundation

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
}
