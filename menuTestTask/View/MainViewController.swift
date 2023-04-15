//
//  MainViewController.swift
//  menuTestTask
//
//  Created by admin1 on 3.04.23.
//

import UIKit

final class MainViewController: UIViewController{
    
    let store = StorageManager()
    let banners: [Photo] = Banner.allBanners()
    var temperatureData: [PivkoElement] = []
    var images: [UIImage?] = []
    let pivkoNetwork = NetworkServicesBeerImpl()
    
    let mainTableView: UITableView = {
        var tableView = UITableView()
        tableView = .init(frame: .zero, style: .plain)
        tableView.layer.cornerRadius = 25
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = R.Colors.inactive
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    let collectionViewBanner: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlow())
        collectionView.backgroundColor = R.Colors.backgraund
        collectionView.showsHorizontalScrollIndicator = false
        
        func setupFlow() -> UICollectionViewFlowLayout {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = .init(width: 300, height: 112)
            layout.scrollDirection = .horizontal
            return layout
        }
        
        return collectionView
    }()
    
    let collectionViewCategories: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlow())
        collectionView.backgroundColor = R.Colors.backgraund
        collectionView.showsHorizontalScrollIndicator = false
        
        func setupFlow() -> UICollectionViewFlowLayout {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = .init(width: 88, height: 32)
            layout.scrollDirection = .horizontal
            return layout
        }
        
        return collectionView
    }()
    
    let dropDownLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Moсква"
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super .init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = R.Colors.backgraund
        configureAppearance()
        pivkoNetwork.getBeerData { result in
            switch result {
            case .success(let data):
                print(data[1].name)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAppearance()
    }
    
    private func configureAppearance() {
        [dropDownLable,
         collectionViewBanner,
         collectionViewCategories,
         mainTableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            dropDownLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            dropDownLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            collectionViewBanner.topAnchor.constraint(equalTo: dropDownLable.bottomAnchor, constant: 20),
            collectionViewBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionViewBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewBanner.heightAnchor.constraint(equalToConstant: 112),
            
            collectionViewCategories.topAnchor.constraint(equalTo: collectionViewBanner.bottomAnchor, constant: 21),
            collectionViewCategories.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionViewCategories.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewCategories.heightAnchor.constraint(equalToConstant: 40),
            
            mainTableView.topAnchor.constraint(equalTo: collectionViewCategories.bottomAnchor, constant: 21),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
        collectionViewBanner.dataSource = self
        collectionViewBanner.register(BannerCell.self, forCellWithReuseIdentifier: "\(BannerCell.self)")
        collectionViewCategories.dataSource = self
        collectionViewCategories.register(СategoryCell.self, forCellWithReuseIdentifier: "\(СategoryCell.self)")
        mainTableView.dataSource = self
        mainTableView.register(BeerTableCell.self, forCellReuseIdentifier: "\(BeerTableCell.self)")
    }
}

//MARK: - CollectionDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViewCategories: return 4
        case collectionViewBanner: return banners.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case collectionViewBanner:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BannerCell.self)",
                                                                for: indexPath) as? BannerCell
            else { return UICollectionViewCell() }
            cell.imageView.image = UIImage(named: banners[indexPath.item].imageName)
            return cell
        case collectionViewCategories:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(СategoryCell.self)",
                                                                for: indexPath) as? СategoryCell
            else { return UICollectionViewCell() }
            cell.buttonCell.setTitle("Пицца", for: .normal)
            return cell
        default: return UICollectionViewCell()
        }
    }
}

//MARK: - TableDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        temperatureData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BeerTableCell.self)",
                                                       for: indexPath) as? BeerTableCell
        else { return UITableViewCell() }
        let description = temperatureData[indexPath.row].description
        let title = temperatureData[indexPath.row].name
        cell.descriptionText.text = description
        cell.headerText.text = title
        return cell
    }
}

