//
//  TownView.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/7.
//

import SwiftUI

struct TownView: View {
    @Binding var dayTime: DayTime
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Color.clear
                VStack {
                    dayTime.icon
                    Text("Town")
                }
            }
            Button("Rest in a INN") {
                withAnimation {
                    dayTime = .day
                }
            }
        }
    }
}

#Preview {
    TownView(dayTime: .constant(.night))
}
