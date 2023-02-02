//
//  GameModel.swift
//  LADISimulator
//
//  Created by Simon Berner on 28.01.23.
//

import Foundation

/// The GameModel is the delegate by conforming to the delegate protocol. The GameModel is the glue between the view and the simulator.
final class GameModel: ObservableObject, GameSimulatorDelegate {
    @Published var gameState = GameState(homeTeamScore: 0, guestTeamScore: 0, scoringTeamName: "", lastAction: "")

    let simulator = GameSimulator()

    init() {
        // Register the GameModel as the delegate of the GameSimulator
        // (The current instance of GameModel is the delegate of the GameSimulator)
        simulator.delegate = self
    }

    // Gets called every 2 seconds based on the GameSimulator with a new gameState
    func didUpdate(gameState: GameState) {
        self.gameState = gameState
    }

    func didCompleteGame() {
        simulator.end()
    }

}
