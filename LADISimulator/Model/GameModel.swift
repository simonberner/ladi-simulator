//
//  GameModel.swift
//  LADISimulator
//
//  Created by Simon Berner on 28.01.23.
//

import Foundation

/// The GameModel is the delegate by conforming to the delegate protocol. The GameModel can be observed.
final class GameModel: ObservableObject, GameSimulatorDelegate {
    @Published var gameState = GameState(homeTeamScore: 0, guestTeamScore: 0, scoringTeamName: "", lastAction: "")

    let simulator = GameSimulator()

    init() {
        // Register the GameModel as delegate of the GameSimulator
        simulator.delegate = self
    }

    // Update the state of the game
    func didUpdate(gameState: GameState) {
        self.gameState = gameState
    }

    func didCompleteGame() {
        // TODO: implement
    }

}
