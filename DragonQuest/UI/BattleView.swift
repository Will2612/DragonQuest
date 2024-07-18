//
//  BattleView.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/18.
//

import SwiftUI

struct BattleView: View {
    @ObservedObject var battle: Battle
    
    var field: MapTile
    
    var body: some View {
        ZStack {
//            Image(field.battleMap)
//                .resizable()
            VStack {
                HStack { // enemy view
//                    ForEach(battle.enemies) { enemy in
//                        EnemyView(enemy)
//                    }
                }
                
                HStack { // player view
                    
                }
            }
        }
    }
}

#Preview {
    BattleView(battle: .init(enemies: [], party: []), field: .init(type: .grass))
}
