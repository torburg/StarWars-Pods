//
//  Character.swift
//  StarWars
//
//  Created by Maksim Torburg on 15.08.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct Character: Decodable {
    var id: Int
    var name: String
    var avatar: String
    var homeworld: Apprentices?
    var height: Double?
    var mass: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name, homeworld, height, mass
        case avatar = "image"
    }
}

enum Apprentices: Decodable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Apprentices.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Apprentices"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}
