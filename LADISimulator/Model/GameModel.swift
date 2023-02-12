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
    var lAStarted = false
    let simulator = GameSimulator()

    init() {
        // Register the GameModel as the delegate of the GameSimulator
        // (The current instance of GameModel is the delegate of the GameSimulator)
        simulator.delegate = self
    }

    func startLiveActivity() {
        let attributes = GameAttributes(homeTeam: "warriors", guestTeam: "bulls")
        let currentGameState = ActivityContent(state: GameAttributes.GameStatus(gameState: gameState), staleDate: nil)

        // Start the LA (if it is not already running)
        if !lAStarted {
            do {
                liveActivity = try Activity.request(attributes: attributes, content: currentGameState)
                lAStarted = true
                // with pushToken setup
    //            liveActivity = try Activity.request(attributes: attributes, content: currentGameState, pushType: .token)
    //            liveActivity?.pushToken

            } catch {
                print(error.localizedDescription)
            }
        }

    }

    // Gets called every 2 seconds based on the GameSimulator with a new gameState
    func didUpdate(gameState: GameState) {
        self.gameState = gameState
        let currentGameState = ActivityContent(state: GameAttributes.GameStatus(gameState: gameState), staleDate: nil)

        // async/await: Update the LA
        Task {
            await liveActivity?.update(currentGameState)
        }
    }

    func didCompleteGame() {
        let currentGameState = ActivityContent(state: GameAttributes.GameStatus(gameState: gameState), staleDate: nil)
        lAStarted = false

        // async/await: End the LA
        Task {
            await liveActivity?.end(currentGameState, dismissalPolicy: .default) // default: stays on the lock screen for 4h or until the user dismisses it
        }
    }

}
