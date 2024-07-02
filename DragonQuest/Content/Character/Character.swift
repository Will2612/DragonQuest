//
//  Character.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/2.
//

import Foundation

protocol Character: Identifiable, Codable {
    var id: String { get set }
    var name: String { get set }
}

class Player: Character {
    var id: String
    var name: String
    
}
