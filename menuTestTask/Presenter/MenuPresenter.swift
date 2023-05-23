//
//  MenuPresenter.swift
//  menuTestTask
//
//  Created by admin1 on 13.05.23.
//

import Foundation

protocol MenuPresenterProtocol {
    func setDataTableView()
}

final class MenuPresenterImpl: MenuPresenterProtocol {
    weak var view: MenuViewProtocol?
    var beer: [BeerElement]
    
    init(view: MenuViewProtocol, beer: [BeerElement]) {
        self.view = view
        self.beer = beer
    }
    
    func setDataTableView() {
        print(beer)
        view?.setTableView(beerData: beer)
    }
}

