//
//  DayTime.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/7.
//

import SwiftUI

enum DayTime: String {
    case dawn
    case day
    case sunset
    case night

    mutating func next() {
        switch self {
        case .dawn:
            self = .day
        case .day:
            self = .sunset
        case .sunset:
            self = .night
        case .night:
            self = .dawn
        }
    }
    
    var icon: Image {
        switch self {
        case .dawn:
            Image(systemName: "sunrise.fill")
        case .day:
            Image(systemName: "sun.max")
        case .sunset:
            Image(systemName: "sunset.fill")
        case .night:
            Image(systemName: "moon.stars")
        }
    }
}


struct DayTimePreferenceKey: PreferenceKey {
    static var defaultValue: DayTime = .day
    
    static func reduce(value: inout DayTime, nextValue: () -> DayTime) {
        value = nextValue()
    }
}

struct DayTimeModifier: ViewModifier {
    let dayTime: DayTime
    
    func body(content: Content) -> some View {
        content
            .preference(key: DayTimePreferenceKey.self, value: dayTime)
    }
}

extension View {
    func dayTime(_ dayTime: DayTime) -> some View {
        self.modifier(DayTimeModifier(dayTime: dayTime))
    }
}
