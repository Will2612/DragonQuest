//
//  WorldMapView.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/7.
//

import SwiftUI

struct WorldMapView: View {
    @Binding var dayTime: DayTime
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.clear
            VStack {
                dayTime.icon
                Text("World Map")
                Button("Time passed") {
                    withAnimation {
                        dayTime.next()
                    }
                }
            }
        }
    }
}

#Preview {
    WorldMapView(dayTime: .constant(.dawn))
}
