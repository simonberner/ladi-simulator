//
//  GameState.swift
//  LADISimulator
//
//  Created by Simon Berner on 28.01.23.
//

import Foundation

struct GameState {
    let homeTeamScore: Int
    let guestTeamScore: Int
    let scoringTeamName: String
    let lastAction: String

    // computed property (does not store a value!)
    // HomeTeam: Golden State Warriors / GuestTeam: Chicago Bulls
    var winnerTeamName: String {
        homeTeamScore > guestTeamScore ? "warriors" : "bulls"
    }
}
