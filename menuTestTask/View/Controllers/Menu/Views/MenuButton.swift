//
//  MenuButton.swift
//  menuTestTask
//
//  Created by admin1 on 15.04.23.
//

import UIKit

final class MenuButton: UIButton {
    
    let menuLable: UILabel = {
        let lable = UILabel()
        lable.textColor = R.Colors.textColor
        lable.font = R.Font.helvetica(with: 15)
        lable.text = "Москва"
        return lable
    }()
    
    let imageArrow: UIImageView = {
        var image = UIImageView()
        image.image = R.Images.downArrow
        image.tintColor = R.Colors.activeAlpha04
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureMenuButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuButton {
    func configureMenuButton() {
        [menuLable, imageArrow].forEach { addViews(view: $0) }
        
        buttonAnimation(self)
        
        NSLayoutConstraint.activate([
            menuLable.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            imageArrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageArrow.leadingAnchor.constraint(equalTo: menuLable.trailingAnchor, constant: 10),
            imageArrow.heightAnchor.constraint(equalToConstant: 5),
            imageArrow.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
}
