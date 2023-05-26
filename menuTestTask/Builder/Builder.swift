//
//  Builder.swift
//  menuTestTask
//
//  Created by admin1 on 25.05.23.
//

import UIKit

protocol Builder {
    static func createMenuModule() -> UIViewController
    static func createMenuDetailModule(beerElement: BeerElement?) -> UIViewController
}

class ModelBuilder: Builder {
    static func createMenuModule() -> UIViewController {
        let view = MenuViewController()
        let networkService = NetworkServicesBeerImpl()
        let presenter = MenuPresenterImpl(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createMenuDetailModule(beerElement: BeerElement?) -> UIViewController {
        let view = MenuDetailViewController()
        let networkService = NetworkServicesBeerImpl()
        let presenter = MenuDetailPresenter(view: view,
                                                networkService: networkService,
                                                beerElement: beerElement)
        view.presenter = presenter
        return view
    }
}
