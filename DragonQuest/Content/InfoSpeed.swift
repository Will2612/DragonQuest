//
//  InfoSpeed.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/7.
//

import SwiftUI

enum InfoSpeed: Int {
    case slow = 10
    case normal = 20
    case fast = 30
}

struct InfoSpeedKey: EnvironmentKey {
    static let defaultValue: InfoSpeed = .normal
}

extension EnvironmentValues {
    var infoSpeed: InfoSpeed {
        get { self[InfoSpeedKey.self] }
        set { self[InfoSpeedKey.self] = newValue }
    }
}

struct InfoSpeedModifier: ViewModifier {
    let speed: InfoSpeed
    
    func body(content: Content) -> some View {
        content.environment(\.infoSpeed, speed)
    }
}

extension View {
    func infoSpeed(_ speed: InfoSpeed) -> some View {
        self.modifier(InfoSpeedModifier(speed: speed))
    }
}
