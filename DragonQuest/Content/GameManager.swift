//
//  GameManager.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/7.
//

import Foundation

class GameManager: ObservableObject {
    @Published var scene: GameScene = .landing
    @Published var map: any Map = World(id: "Continent", name: "Continent", size: .init(width: 1000, height: 1000), tiles: [[]])
    
    func start() {
        scene = .game
    }
    
    func quit() {
        scene = .landing
    }
}
