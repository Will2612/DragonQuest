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
        dayTime.icon
    }
}

#Preview {
    TownView(dayTime: .constant(.night))
}
