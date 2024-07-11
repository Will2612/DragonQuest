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
            HUDView(text: "In a land far, far away, in a time forgotten by many, there existed a mystical kingdom known for its brave warriors and magical creatures. The kingdom was protected by an elite group of heroes who embarked on epic adventures, fighting against the forces of darkness and bringing peace to the realm. These heroes were renowned for their courage, strength, and wisdom. As they journeyed through enchanted forests, across treacherous mountains, and into ancient ruins, they encountered formidable foes and uncovered hidden secrets. Their tales of valor and friendship echoed through the ages, inspiring future generations to take up the mantle of heroism and continue the legacy of the DragonQuest.")
                .multilineTextAlignment(.center)

            currentDayTime.icon
                .font(.title)

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
