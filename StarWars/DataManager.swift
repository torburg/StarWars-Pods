//
//  DataManager.swift
//  StarWars
//
//  Created by Maksim Torburg on 15.08.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

protocol DataViewControllerDelegate {
    func updateView()
}

class DataManager {
    var items: [Character]?
    private let networkManager = NetworkManager()
    let delegate: DataViewControllerDelegate?
    
    init(delegate: DataViewControllerDelegate) {
        self.delegate = delegate
        networkManager.getCharacters { (characters) in
            self.items = characters
            delegate.updateView()
        }
    }
    
    func getItemByIndexPath(indexPath: IndexPath) -> Character? {
        return items?[indexPath.row] ?? nil
    }
    
    func getItemsAmount() -> Int {
        return items?.count ?? 0
    }
}
