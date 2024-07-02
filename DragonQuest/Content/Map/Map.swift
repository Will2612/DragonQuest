//
//  Map.swift
//  DragonQuest
//
//  Created by Will Zhang on 2024/7/2.
//

import Foundation

protocol Map: Identifiable, Codable {
    var id: String { get set }
    var name: String { get set }
    var size: MapSize { get set }
    var tiles: [[MapTile]] { get set }
    
    func tile(at location: MapLocation) -> MapTile?
    func portals() -> [MapTile]
}

extension Map {
    func tile(at location: MapLocation) -> MapTile? {
        guard location.x >= 0, location.x < size.width, location.y >= 0, location.y < size.height else {
            return nil
        }
        return tiles[location.y][location.x]
    }
    
    func portals() -> [MapTile] {
        return tiles.flatMap { row in
            row.filter { tile in
                tile.portal != nil
            }
        }
    }
}

struct MapSize: Codable {
    var width: Int
    var height: Int
}

struct MapLocation: Codable {
    var x: Int
    var y: Int
}

struct MapTile: Codable {
    var type: TileType
    var portal: Portal?
    
    enum TileType: String, Codable {
        case ground
        case wood
        case grass
        case desert
        case river
        case sea
        case mountain
    }
}

struct Portal: Codable {
    var mapId: String
    var location: MapLocation
}

struct World: Map {
    var id: String
    var name: String
    var size: MapSize
    var tiles: [[MapTile]]
}

struct Town: Map {
    var id: String
    var name: String
    var size: MapSize
    var tiles: [[MapTile]]
}

struct Dungeon: Map {
    var id: String
    var name: String
    var size: MapSize
    var tiles: [[MapTile]]
}
