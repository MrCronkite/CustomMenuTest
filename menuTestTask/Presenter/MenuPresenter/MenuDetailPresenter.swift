//
//  MenuDetailPresenter.swift
//  menuTestTask
//
//  Created by admin1 on 26.05.23.
//

import Foundation

protocol MenuDetailViewProtocol: AnyObject {
    func setBeerData(beerElement: BeerElement?)
}

protocol MenuDetailViewPresenterProtocol: AnyObject {
    init(view: MenuDetailViewProtocol, networkService: NetworkServicesBeer, beerElement: BeerElement?)
    func setBeerData()
}

class MenuDetailPresenter: MenuDetailViewPresenterProtocol {
    weak var view: MenuDetailViewProtocol?
    let networkService: NetworkServicesBeer
    var beerElement: BeerElement?
    
    required init(view: MenuDetailViewProtocol, networkService: NetworkServicesBeer, beerElement: BeerElement?) {
        self.view = view
        self.networkService = networkService
        self.beerElement = beerElement
    }
    
    public func setBeerData() {
        self.view?.setBeerData(beerElement: beerElement)
    }
}

