//
//  GameModel.swift
//  LADISimulator
//
//  Created by Simon Berner on 28.01.23.
//

import Foundation
import ActivityKit

/// The GameModel is the delegate by conforming to the delegate protocol.
/// It can also be seen as the glue between the view and the simulator.
final class GameModel: ObservableObject, GameSimulatorDelegate {
    @Published var gameState = GameState(homeTeamScore: 0, guestTeamScore: 0, scoringTeamName: "", lastAction: "")

    var liveActivity: Activity<GameAttributes>? = nil
    let simulator = GameSimulator()

    init() {
        // Register the GameModel as the delegate of the GameSimulator
        // (The current instance of GameModel is the delegate of the GameSimulator)
        simulator.delegate = self
    }

    func startLiveActivity() {
        let attributes = GameAttributes(homeTeam: "warriors", guestTeam: "bulls") // TODO: replace with non static attribute data
        let currentGameState = GameAttributes.GameStatus(gameState: gameState)

        do {
            liveActivity = try Activity.request(attributes: attributes, contentState: currentGameState)
        } catch {
            print(error.localizedDescription)
        }
    }

    // Gets called every 2 seconds based on the GameSimulator with a new gameState
    func didUpdate(gameState: GameState) {
        self.gameState = gameState

        // async/await: update the LA
        Task {
            await liveActivity?.update(using: .init(gameState: gameState))
        }
    }

    func didCompleteGame() {

        Task {
            await liveActivity?.end(using: .init(gameState: simulator.endGame()), dismissalPolicy: .default) // default: stays on the lock screen for 4h or until the user dismisses it
        }
    }

}
