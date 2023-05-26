//
//  MenuPresenter.swift
//  menuTestTask
//
//  Created by admin1 on 13.05.23.
//

import UIKit

protocol MenuViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MenuPresenterProtocol: AnyObject {
    init(view: MenuViewProtocol, networkService: NetworkServicesBeer)
    func getBeer()
    var beerElement: [BeerElement]? { get set }
    var images: [UIImage] { get set }
    func getImagesBeer()
}

final class MenuPresenterImpl: MenuPresenterProtocol {
    weak var view: MenuViewProtocol?
    let networkService: NetworkServicesBeer
    var beerElement: [BeerElement]?
    var images = [UIImage] ()
    
    required init(view: MenuViewProtocol, networkService: NetworkServicesBeer) {
        self.view = view
        self.networkService = networkService
        getBeer()
    }
    
    func getBeer() {
        networkService.getBeerData { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.beerElement = data
                    self.getImagesBeer()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func getImagesBeer() {
        let dispatchGroup = DispatchGroup()
        guard let beerElement = beerElement else { return }
        for i in 0..<beerElement.count {
            print(beerElement[i].imageURL)
            dispatchGroup.enter()
            asyncLoadImage(imageURL: URL(string: beerElement[i].imageURL)!,
                           runQueue: DispatchQueue.global(),
                           completionQueue: DispatchQueue.main) { [weak self] result, error in
                guard let image = result else { return }
                guard let self = self else { return }
                self.images.append(image)
                if self.images.count == 25 { self.view?.succes() }
                dispatchGroup.leave()
            }
        }
    }
    
    func asyncLoadImage(imageURL: URL, runQueue: DispatchQueue,
                        completionQueue: DispatchQueue,
                        completion: @escaping (UIImage?, Error?) -> ()) {
        runQueue.async {
            do {
                let data = try Data(contentsOf: imageURL)
                completionQueue.async { completion(UIImage(data: data), nil)}
            } catch let error {
                completionQueue.async { completion(nil, error)}
            }
        }
    }
}

