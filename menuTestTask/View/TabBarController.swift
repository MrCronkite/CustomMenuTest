//
//  ViewController.swift
//  testTaskMenu
//
//  Created by admin1 on 3.04.23.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case menu
    case contacts
    case profile
    case cart
}

final class TabBarController: UITabBarController{
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
    }
    
    private func configureAppearance() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = R.Colors.inactive.cgColor
        
        let controllers: [NavBarControoler] = Tabs.allCases.map { tab in
            let controller = NavBarControoler()
            let assemblyBuilder = AssemblyModelBuilder()
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.ImagesBar.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
      
            let router = Router(navigationController: controller, assemblyBuilder: assemblyBuilder)
            
            switch tab {
            case .menu: router.initialViewController()
            case .contacts: router.otherViewController()
            case .profile: router.otherViewController()
            case .cart: router.otherViewController()
            }
            
            return controller
        }
        
        setViewControllers(controllers, animated: false)
    }
    
    //    private func getController(for tab: Tabs) -> UIViewController {
    //        switch tab {
    //        case .menu: return MenuViewController()
    //        case .contacts: return UIViewController()
    //        case .profile: return UIViewController()
    //        case .cart: return UIViewController()
    //        }
    //    }
}

