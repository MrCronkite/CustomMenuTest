//
//  CategoryCell.swift
//  menuTestTask
//
//  Created by admin1 on 3.04.23.
//

import UIKit

final class СategoryCell: UICollectionViewCell {
//    let buttonCell: UIButton = {
//        let button = UIButton()
//        button.layer.borderWidth = 1
//        button.layer.borderColor = R.Colors.activeAlpha04.cgColor
//        button.backgroundColor = .white
//        button.buttonAnimation(button)
//        button.setTitleColor(R.Colors.textColor, for: .normal)
//        button.titleLabel?.font = R.Font.helvetica(with: 13)
//        button.layer.cornerRadius = 15
//        return button
//    }()
    
    let lableText: UILabel = {
        let lable = UILabel()
        lable.layer.borderWidth = 1
        lable.layer.borderColor = R.Colors.activeAlpha04.cgColor
        lable.backgroundColor = .white
        lable.textColor = R.Colors.textColor
        lable.textAlignment = .center
        lable.font = R.Font.helvetica(with: 15)
        lable.layer.cornerRadius = 15
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCategoryCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCategoryCell()
    }
    
    func setupCategoryCell() {
        self.contentView.addViews(view: lableText)
        lableText.contentMode = .scaleAspectFill
        lableText.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            lableText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lableText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lableText.topAnchor.constraint(equalTo: contentView.topAnchor),
            lableText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
