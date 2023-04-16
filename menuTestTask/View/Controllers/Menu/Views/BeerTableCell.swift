//
//  BeerTableCell.swift
//  menuTestTask
//
//  Created by admin1 on 4.04.23.
//

import UIKit

final class BeerTableCell: UITableViewCell {
    
    let imageViewBeer: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 66
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let headerText: UILabel = {
        let text = UILabel()
        text.font = R.Font.helvetica(with: 18)
        text.numberOfLines = 2
        text.textColor = R.Colors.textColor
        text.text = "Betchina and grib"
        return text
    }()
    
    let descriptionText: UILabel = {
       let lable = UILabel()
        lable.textColor = R.Colors.inactive
        lable.text = "Betchina and grib china and grib china and grib china and grib china and grib china and grib china and grib china and grib china and grib china and grib"
        lable.font = R.Font.helvetica(with: 12)
        lable.numberOfLines = 4
       return lable
    }()
    
    let buttonPrice: UIButton = {
        let button = UIButton()
        button.setTitle("от 345 р", for: .normal)
        button.layer.borderWidth = 1
        button.buttonAnimation(button)
        button.layer.borderColor = R.Colors.active.cgColor
        button.layer.cornerRadius = 12
        button.setTitleColor(R.Colors.textColor, for: .normal)
        button.titleLabel?.font = R.Font.helvetica(with: 14)
        button.backgroundColor = .white
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCell()
        }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    private func setupCell() {
        [imageViewBeer, headerText, descriptionText, buttonPrice].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageViewBeer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageViewBeer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageViewBeer.widthAnchor.constraint(equalToConstant: 132),
            imageViewBeer.heightAnchor.constraint(equalToConstant: 132),
            
            headerText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerText.leadingAnchor.constraint(equalTo: imageViewBeer.trailingAnchor, constant: 20),
            headerText.widthAnchor.constraint(equalToConstant: 180),
            
            descriptionText.topAnchor.constraint(equalTo: headerText.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: imageViewBeer.trailingAnchor, constant: 20),
            descriptionText.heightAnchor.constraint(equalToConstant: 60),
            descriptionText.widthAnchor.constraint(equalToConstant: 170),
            
            buttonPrice.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 15),
            buttonPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            buttonPrice.heightAnchor.constraint(equalToConstant: 32),
            buttonPrice.widthAnchor.constraint(equalToConstant: 87),
            buttonPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
