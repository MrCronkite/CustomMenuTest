//
//  MenuRouter.swift
//  menuTestTask
//
//  Created by admin1 on 26.05.23.
//

import UIKit

protocol MenuRouter {
    var navigationController: NavBarControoler? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: MenuRouter {
    func initialViewController()
    func otherViewController()
    func showDetail(beerElement: BeerElement?, image: UIImage)
}

class Router: RouterProtocol {
    var navigationController: NavBarControoler?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: NavBarControoler, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let menuViewController = assemblyBuilder?.createMenuModule(router: self) else { return }
            navigationController.viewControllers = [menuViewController]
        }
    }
    
    func otherViewController() {
        if let navigationController = navigationController {
            navigationController.viewControllers = [UIViewController()]
        }
    }
    
    func showDetail(beerElement: BeerElement?, image: UIImage) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createMenuDetailModule(beerElement: beerElement,
                                                                                     image: image,
                                                                                     router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
}
