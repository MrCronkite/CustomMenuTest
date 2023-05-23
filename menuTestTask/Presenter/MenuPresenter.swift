//
//  MenuPresenter.swift
//  menuTestTask
//
//  Created by admin1 on 13.05.23.
//

import Foundation

protocol MenuPresenterProtocol: AnyObject {
    func setDataTableView()
}

final class MenuPresenterImpl: MenuPresenterProtocol {
    weak var view: MenuViewProtocol?
    let networkServicesBeer = NetworkServicesBeerImpl()
    
    init(view: MenuViewProtocol) {
        self.view = view
    }
    
    func setDataTableView() {
        print("hello")
        networkServicesBeer.getBeerData { result in
            switch result {
            case .success(let data):
                print(data)
                self.view?.setTableView(beerData: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}



