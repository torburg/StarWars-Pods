//
//  ViewController.swift
//  StarWars
//
//  Created by Maksim Torburg on 15.08.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var charactersList: UITableView!
    var dataManager: DataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager = DataManager(delegate: self)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager?.getItemsAmount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequedCell = charactersList.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentidier, for: indexPath)
        guard let cell = dequedCell as? CharacterTableViewCell,
            let item = dataManager?.getItemByIndexPath(indexPath: indexPath) else { return dequedCell }
        cell.onBind(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

// MARK: - To update view after data change
extension ViewController: DataViewControllerDelegate {
    func updateView() {
        charactersList.reloadData()
    }
}
