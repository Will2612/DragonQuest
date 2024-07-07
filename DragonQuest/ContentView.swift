//
//  ContentView.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/7.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameManager: GameManager
    @AppStorage("InfoSpeed") var infoSpeed: InfoSpeed = .normal

    var body: some View {
        switch gameManager.scene {
        case .landing:
            LandingView()
        case .game:
            GameView()
                .dayTime(.day)
                .infoSpeed(infoSpeed)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(GameManager())
        .environment(\.colorScheme, .dark)
}
