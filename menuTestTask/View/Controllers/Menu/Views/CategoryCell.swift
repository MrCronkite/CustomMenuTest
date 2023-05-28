//
//  CategoryCell.swift
//  menuTestTask
//
//  Created by admin1 on 3.04.23.
//

import UIKit

final class СategoryCell: UICollectionViewCell {
    let buttonCell: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = R.Colors.activeAlpha04.cgColor
        button.backgroundColor = .white
        button.buttonAnimation(button)
        button.setTitleColor(R.Colors.textColor, for: .normal)
        button.titleLabel?.font = R.Font.helvetica(with: 13)
        button.layer.cornerRadius = 15
        return button
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
        self.contentView.addViews(view: buttonCell)
        buttonCell.contentMode = .scaleAspectFill
        
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            buttonCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            buttonCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            buttonCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            buttonCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
