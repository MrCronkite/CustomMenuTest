//
//  MenuPresenter.swift
//  menuTestTask
//
//  Created by admin1 on 13.05.23.
//

import Foundation

protocol MenuViewProtocolPresenter: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MenuPresenterProtocol: AnyObject {
    init(view: MenuViewProtocolPresenter, networkService: NetworkServicesBeer)
    func getBeer()
    var beerElement: [BeerElement]? { get set }
}

final class MenuPresenterImpl: MenuPresenterProtocol {
    weak var view: MenuViewProtocolPresenter?
    let networkService: NetworkServicesBeer!
    var beerElement: [BeerElement]?
    
    required init(view: MenuViewProtocolPresenter, networkService: NetworkServicesBeer) {
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
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}

