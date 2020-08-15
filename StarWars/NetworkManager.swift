//
//  NetworkManager.swift
//  StarWars
//
//  Created by Maksim Torburg on 15.08.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    let endPoint = "https://cdn.rawgit.com/akabab/starwars-api/0.2.1/api/all.json"
    
    func getCharacters(completion: @escaping ([Character])->()) {
        AF.request(endPoint).responseDecodable(of: [Character].self) { response in
            if response.error != nil {
                print(response.error)
                completion([])
            }
            guard let characters = response.value else { completion([]); return }
            completion(characters)
        }
    }
}
