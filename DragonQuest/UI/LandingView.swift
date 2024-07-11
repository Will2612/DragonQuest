//
//  LandingView.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/2.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject var gameManager: GameManager
    @AppStorage("InfoSpeed") private var infoSpeed: InfoSpeed = .normal
    
    var body: some View {
        VStack {
            Text("Dragon Quest III")
                .font(.largeTitle)
                .padding(.bottom, 50)
            
            VStack(spacing: 10) {
                Button("START NEW GAME") {
                    gameManager.start()
                }
                Button("LOAD GAME") {
                    
                }
            }
            .padding(.bottom, 20)
            
            HStack {
                Text("SPEED")
                    .foregroundStyle(.secondary)
                Picker("SPEED", selection: $infoSpeed) {
                    Text("Slow").tag(InfoSpeed.slow)
                    Text("Normal").tag(InfoSpeed.normal)
                    Text("Fast").tag(InfoSpeed.fast)
                }
                .pickerStyle(.automatic)
            }
            .tint(.secondary)
        }
    }
}

#Preview {
    LandingView()
}
