//
//  DragonQuest.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/2.
//

import SwiftUI

@main
struct DragonQuest: App {
    @State var scene: GameScene = .landing
    
    var body: some Scene {
        WindowGroup {
            switch scene {
            case .landing:
                LandingView()
            case .game:
                GameView()
            }
        }
    }
}
