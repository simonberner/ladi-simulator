//
//  GameAttributes.swift
//  LADISimulator
//
//  Created by Simon Berner on 04.02.23.
//

import Foundation
import ActivityKit

// Put in the GameState here
struct GameAttributes: ActivityAttributes {
    // The associated type that describes the dynamic content of a Live Activity.
    public typealias GameStatus = ContentState

    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var gameState: GameState
    }

    // Fixed non-changing properties about your activity go here!
    var homeTeam: String
    var guestTeam: String
}
