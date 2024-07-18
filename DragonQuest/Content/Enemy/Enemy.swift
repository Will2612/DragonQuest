//
//  Enemy.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/2.
//

import Foundation

protocol Enemy: Codable, Identifiable {
    var name: String { get set }
    var id: UUID { get }
}

extension Enemy {
    var id: UUID {
        UUID()
    }
}
