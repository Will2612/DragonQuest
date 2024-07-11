//
//  HUDView.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/11.
//

import SwiftUI
import Combine

struct HUDView: View {
    @State private var currentIndex = 0
    @Environment(\.infoSpeed) private var infoSpeed
    @State private var timerCancellable: AnyCancellable?
    
    let text: String
    
    var body: some View {
        Text(String(text.prefix(currentIndex)))
            .padding()
            .frame(maxWidth: 300, minHeight: 40)
            .background(
                RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                .stroke(Color.primary, lineWidth: 1)
            )
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
    }
    
    private func startTimer() {
        stopTimer()
        currentIndex = 0
        
        timerCancellable = Timer.publish(every: 1.0 / Double(infoSpeed.rawValue), on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if currentIndex < text.count {
                    currentIndex += 1
                } else {
                    stopTimer()
                }
            }
    }
    
    private func stopTimer() {
        timerCancellable?.cancel()
        timerCancellable = nil
    }
}

#Preview {
    HUDView(text: "In the ancient kingdom of Eldoria, brave heroes embarked on epic quests to defeat the dark forces.")
        .infoSpeed(.slow)
    HUDView(text: "In the ancient kingdom of Eldoria, brave heroes embarked on epic quests to defeat the dark forces.")
        .infoSpeed(.normal)
    HUDView(text: "In the ancient kingdom of Eldoria, brave heroes embarked on epic quests to defeat the dark forces.")
        .infoSpeed(.fast)
}
