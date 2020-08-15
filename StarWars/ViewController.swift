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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequedCell = charactersList.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentidier, for: indexPath)
        guard let cell = dequedCell as? CharacterTableViewCell else { return dequedCell }
        cell.onBind(with: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
