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
        dayTime.icon
    }
}

#Preview {
    WorldMapView(dayTime: .constant(.dawn))
}
