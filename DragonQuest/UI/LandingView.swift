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
                .font(.title)
                .padding(.bottom, 40)
            Button("START NEW GAME") {
                gameManager.start()
            }
            Button("LOAD GAME") {

            }
            VStack {
                Text("SPEED")
                    .foregroundStyle(.blue)
                Picker("", selection: $infoSpeed) {
                    Text("Slow").tag(InfoSpeed.slow)
                    Text("Normal").tag(InfoSpeed.normal)
                    Text("Fast").tag(InfoSpeed.fast)
                }
                .pickerStyle(.automatic)
                
            }
        }
    }
}

#Preview {
    LandingView()
}
