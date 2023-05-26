//
//  MenuDetailViewController.swift
//  menuTestTask
//
//  Created by admin1 on 26.05.23.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    let lableBeer: UILabel = {
        let lable = UILabel()
        lable.font = R.Font.helvetica(with: 24)
        lable.text = "Hello world"
        lable.textAlignment = .center
        return lable
    }()
    
    let descriptionBeer: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    let imageBeer: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    var presenter: MenuDetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        addConstraintViews()
        configureAppearance()
        presenter.setBeerData()
    }
}

extension MenuDetailViewController {
    private func setupViews() {
        [
            lableBeer,
            descriptionBeer,
            imageBeer
        ].forEach { view.addViews(view: $0) }
    }
    
    private func addConstraintViews() {
        NSLayoutConstraint.activate([
            lableBeer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            lableBeer.widthAnchor.constraint(equalToConstant: 200),
            lableBeer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureAppearance() {
        view.backgroundColor = R.Colors.backgraund
    }
}

extension MenuDetailViewController: MenuDetailViewProtocol {
    func setBeerData(beerElement: BeerElement?) {
        lableBeer.text = beerElement?.name 
    }
}
