//
//  GameView.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/2.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameManager: GameManager
    @State private var currentDayTime: DayTime = .day
    @Environment(\.infoSpeed) private var infoSpeed

    var body: some View {
        VStack {
            currentDayTime.icon
                .font(.title)
            
            Text("Current Info Speed: \(infoSpeed.rawValue)")
                .padding()
            
            
            Button("Switch Day Time") {
                withAnimation {
                    currentDayTime.next()
                }
            }

            Button("Quit") {
                gameManager.quit()
            }
        }
        .padding()
        .dayTime(currentDayTime)
        .onPreferenceChange(DayTimePreferenceKey.self) { value in
                    self.currentDayTime = value
                }
    }
}

#Preview {
    GameView()
        .infoSpeed(.fast)
}
