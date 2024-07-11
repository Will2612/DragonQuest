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
    @State private var showHUD = true

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ZStack {
                        Color.clear
                        WorldMapView(dayTime: $currentDayTime)
                            .font(.title)
                    }
                    .frame(height: 200)
                    .padding(8)
                    .border(.white)
                    NavigationLink("Town") {
                        TownView(dayTime: $currentDayTime)
                            .frame(height: 200)
                            .padding(8)
                            .border(.white)
                    }
                    Button("Quit") {
                        gameManager.quit()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(contentMode: .fit)
            }
        }
        .dayTime(currentDayTime)
        .onPreferenceChange(DayTimePreferenceKey.self) { value in
            self.currentDayTime = value
        }
        .overlay {
            ZStack {
                Color.black
                HUDView(text: "In a land far, far away, in a time forgotten by many, there existed a mystical kingdom known for its brave warriors and magical creatures. The kingdom was protected by an elite group of heroes who embarked on epic adventures, fighting against the forces of darkness and bringing peace to the realm. These heroes were renowned for their courage, strength, and wisdom. As they journeyed through enchanted forests, across treacherous mountains, and into ancient ruins, they encountered formidable foes and uncovered hidden secrets. Their tales of valor and friendship echoed through the ages, inspiring future generations to take up the mantle of heroism and continue the legacy of the DragonQuest.")
                    .showBorder(false)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .opacity(showHUD ? 1 : 0)
            .onTapGesture {
                withAnimation {
                    showHUD = false
                }
            }
        }
    }
}

#Preview {
    GameView()
        .infoSpeed(.fast)
}
