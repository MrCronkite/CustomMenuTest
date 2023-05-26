//
//  AssemblyModelBuilder.swift
//  menuTestTask
//
//  Created by admin1 on 25.05.23.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMenuModule(router: RouterProtocol) -> UIViewController
    func createMenuDetailModule(beerElement: BeerElement?, image: UIImage, router: RouterProtocol) -> UIViewController
}

class AssemblyModelBuilder: AssemblyBuilderProtocol {
    func createMenuModule(router: RouterProtocol) -> UIViewController {
        let view = MenuViewController()
        let networkService = NetworkServicesBeerImpl()
        let presenter = MenuPresenterImpl(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createMenuDetailModule(beerElement: BeerElement?, image: UIImage, router: RouterProtocol) -> UIViewController {
        let view = MenuDetailViewController()
        let networkService = NetworkServicesBeerImpl()
        let presenter = MenuDetailPresenter(view: view,
                                            networkService: networkService,
                                            beerElement: beerElement,
                                            image: image,
                                            router: router)
        view.presenter = presenter
        return view
    }
}
