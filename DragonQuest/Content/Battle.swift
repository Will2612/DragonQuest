//
//  Battle.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/18.
//

import SwiftUI

class Battle: ObservableObject {
    @Published var enemies: [Enemy]
    @Published var party: [Player]
    
    init(enemies: [Enemy], party: [Player]) {
        self.enemies = enemies
        self.party = party
    }
}
