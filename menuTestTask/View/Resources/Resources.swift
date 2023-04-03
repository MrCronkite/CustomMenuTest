//
//  R.swift
//  testTaskMenu
//
//  Created by admin1 on 3.04.23.
//

import UIKit

enum R {
    enum Colors {
        static var inactive = UIColor(hexString: "#C3C4C9")
        static var active = UIColor(hexString: "#FD3A69")
        static var backgraund = UIColor(hexString: "#E5E5E5")
    }
    
    enum Images {
        static var banner = UIImage(named: "advBanner")
    }
    
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .cart: return "Корзина"
                case .menu: return "Меню"
                case .contacts: return "Контакты"
                case .profile: return "Профиль"
                }
            }
        }
    }
    
    enum ImagesBar {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .cart: return UIImage(named: "cart")
                case .menu: return UIImage(named: "menu")
                case .contacts: return UIImage(named: "contacts")
                case .profile: return UIImage(named: "profile")
                }
            }
        }
    }
}
