//
//  MainViewController.swift
//  menuTestTask
//
//  Created by admin1 on 3.04.23.
//

import UIKit

final class MainViewController: UIViewController{
    
    let banners: [Photo] = Banner.allBanners()
    
    var collectionViewBanner: UICollectionView = {
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
    
    var collectionViewCategories: UICollectionView = {
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
        title = "Mocква"
        view.backgroundColor = R.Colors.backgraund
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAppearance()
    }
    
    private func configureAppearance() {
        [dropDownLable,
         collectionViewBanner,
         collectionViewCategories].forEach {
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
                collectionViewCategories.heightAnchor.constraint(equalToConstant: 40)
                
            ])
            collectionViewBanner.dataSource = self
            collectionViewBanner.register(BannerCell.self, forCellWithReuseIdentifier: "\(BannerCell.self)")
            collectionViewCategories.dataSource = self
        collectionViewCategories.register(СategoryCell.self, forCellWithReuseIdentifier: "\(СategoryCell.self)")
    }
}

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

