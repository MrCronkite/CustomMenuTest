//
//  StorageManager.swift
//  menuTestTask
//
//  Created by admin1 on 4.04.23.
//

import UIKit

// MARK: - CRUD
protocol StorageManagerProtocol {
    func set(_ object: Any?, forKey key: StorageManager.Keys)
    
    func dict(forKey key: StorageManager.Keys) -> [BeerElement]?
    func images(forKey key: StorageManager.Keys) -> [UIImage?]?
}

final class StorageManager {
    
    public enum Keys: String {
        case keysBeer
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        DispatchQueue.global(qos: .userInteractive).async {
            self.userDefaults.set(object, forKey: key)
        }
    }
    
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

extension StorageManager: StorageManagerProtocol {
    
    func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    func dict(forKey key: Keys) -> [BeerElement]? {
        restore(forKey: key.rawValue) as? [BeerElement]
    }
    
    func images(forKey key: Keys) -> [UIImage?]? {
        restore(forKey: key.rawValue) as? [UIImage?]
    }
    
    func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
