//
//  MenuDetailPresenter.swift
//  menuTestTask
//
//  Created by admin1 on 26.05.23.
//

import UIKit

protocol MenuDetailViewProtocol: AnyObject {
    func setBeerData(beerElement: BeerElement?, image: UIImage)
}

protocol MenuDetailViewPresenterProtocol: AnyObject {
    init(view: MenuDetailViewProtocol, networkService: NetworkServicesBeer, beerElement: BeerElement?, image: UIImage)
    func setBeerData()
}

class MenuDetailPresenter: MenuDetailViewPresenterProtocol {
    weak var view: MenuDetailViewProtocol?
    let networkService: NetworkServicesBeer
    var image: UIImage
    var beerElement: BeerElement?
    
    required init(view: MenuDetailViewProtocol, networkService: NetworkServicesBeer, beerElement: BeerElement?, image: UIImage) {
        self.view = view
        self.networkService = networkService
        self.beerElement = beerElement
        self.image = image
    }
    
    public func setBeerData() {
        self.view?.setBeerData(beerElement: beerElement, image: image)
    }
}

