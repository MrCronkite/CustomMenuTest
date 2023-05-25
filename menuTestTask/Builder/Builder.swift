//
//  Builder.swift
//  menuTestTask
//
//  Created by admin1 on 25.05.23.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MenuViewController()
        let networkService = NetworkServicesBeerImpl()
        let presenter = MenuPresenterImpl(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
