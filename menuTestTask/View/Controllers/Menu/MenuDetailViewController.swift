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
        lable.font = R.Font.helvetica(with: 20)
        lable.numberOfLines = 2
        lable.textAlignment = .center
        return lable
    }()
    
    let descriptionBeerLabel: UILabel = {
        let lable = UILabel()
        lable.font = R.Font.helvetica(with: 17)
        lable.numberOfLines = 8
        lable.textAlignment = .center
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
            descriptionBeerLabel,
            imageBeer
        ].forEach { view.addViews(view: $0) }
    }
    
    private func addConstraintViews() {
        NSLayoutConstraint.activate([
            lableBeer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lableBeer.widthAnchor.constraint(equalToConstant: 200),
            lableBeer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionBeerLabel.topAnchor.constraint(equalTo: lableBeer.bottomAnchor, constant: 20),
            descriptionBeerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            descriptionBeerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7)
        ])
    }
    
    private func configureAppearance() {
        view.backgroundColor = R.Colors.backgraund
        navigationController?.navigationBar.isHidden = false
    }
}

extension MenuDetailViewController: MenuDetailViewProtocol {
    func setBeerData(beerElement: BeerElement?) {
        lableBeer.text = beerElement?.name
        descriptionBeerLabel.text = beerElement?.description
    }
}
