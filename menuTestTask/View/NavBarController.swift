//
//  NavBarController.swift
//  menuTestTask
//
//  Created by admin1 on 15.04.23.
//

import UIKit

final class NavBarControoler: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isHidden = true
    }
}
