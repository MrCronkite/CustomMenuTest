//
//  MainViewController.swift
//  menuTestTask
//
//  Created by admin1 on 3.04.23.
//

import UIKit

final class MainViewController: UIViewController{
    
    let banners: [Photo] = Banner.allBanners()
    
    var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlow())
        collectionView.backgroundColor = R.Colors.backgraund
        func setupFlow() -> UICollectionViewFlowLayout{
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = .init(width: 300, height: 112)
            layout.scrollDirection = .horizontal
            return layout
        }
        
        return collectionView
    }()
    
    let dropDownLable: UILabel = {
        let label = UILabel()
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
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        [collectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
            
            NSLayoutConstraint.activate([
//                dropDownLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                dropDownLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 112)
            ])
            collectionView.dataSource = self
            collectionView.register(BannerCell.self, forCellWithReuseIdentifier: "\(BannerCell.self)")
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BannerCell.self)", for: indexPath) as? BannerCell else { return UICollectionViewCell()}
        
        cell.imageView.image = UIImage(named: banners[indexPath.item].imageName)
        return cell
    }
}
