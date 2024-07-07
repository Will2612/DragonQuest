//
//  DragonQuest.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/2.
//

import SwiftUI

@main
struct DragonQuest: App {
    @StateObject private var gameManager = GameManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameManager)
                .environment(\.colorScheme, .dark)
        }
    }
}
