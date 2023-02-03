//
//  GameState.swift
//  LADISimulator
//
//  Created by Simon Berner on 28.01.23.
//

import Foundation

struct GameState: Codable, Hashable {
    let homeTeamScore: Int
    let guestTeamScore: Int
    let scoringTeamName: String
    let lastAction: String

    // computed property (does not store a value, its value is computed!)
    // who is the winning team?
    var winnerTeamName: String {
        homeTeamScore > guestTeamScore ? "warriors" : "bulls"
    }
}
