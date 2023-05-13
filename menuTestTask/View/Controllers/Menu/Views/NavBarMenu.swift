//
//  NavBarMenu.swift
//  menuTestTask
//
//  Created by admin1 on 15.04.23.
//

import UIKit

final class NavBarMenu: UIView {
    
    let dropItemButton: MenuButton = {
        let button = MenuButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = R.Colors.activeAlpha04.cgColor
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addConstraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        addConstraintViews()
        configureAppearance()
    }
    
}

extension NavBarMenu {
    private func setupViews() {
        addViews(view: dropItemButton)
    }
    
    private func addConstraintViews() {
        NSLayoutConstraint.activate([
            dropItemButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dropItemButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dropItemButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            dropItemButton.heightAnchor.constraint(equalToConstant: 35),
            dropItemButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureAppearance() {
        backgroundColor = .white
    }
}
