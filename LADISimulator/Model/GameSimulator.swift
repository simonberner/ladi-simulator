//
//  GameSimulator.swift
//  LADISimulator
//
//  Created by Simon Berner on 28.01.23.
//

import Foundation

/// With the GameSimulator one can start and end a game simulation.
/// (The GameSimulator has a delegate instance to report to)
final class GameSimulator {
    // instance properties
    var homeTeam: Team
    var guestTeam: Team
    var homeScore: Int = 0
    var guestScore: Int = 0
    var homePossession = true
    var possessionCount = 0
    var timer: Timer?

    // Computed instance property (does not store any value)
    var scoringTeam: Team {
        homePossession ? homeTeam : guestTeam
    }

    // Create a delegate protocol instance (a weak reference to omit retain count and ARC can release it from memory)
    // to which the GameSimulator has to report to.
    weak var delegate: GameSimulatorDelegate?

    // Init test data
    init() {
        homeTeam = Team(name: "warriors", players: ["Ph. Collins",
                                                   "A. Grande",
                                                   "M. Jackson",
                                                   "F. Mercury",
                                                   "T. Swift",
                                                   "X. Tentaction",
                                                   "Eminem"])

        guestTeam = Team(name: "bulls", players: ["E. Presley",
                                                  "T. Shakur",
                                                  "L. Gaga",
                                                  "S.Gomez",
                                                  "B. Knowles",
                                                  "D. Lipa",
                                                  "J. Lopez"])
    }

    // Start a game by setting a time interval which fires of runGameSimulator every 2sec
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runGameSimulator), userInfo: nil, repeats: true)
    }

    // Reports to the delegate (GameModel in our case)
    func end() {
        delegate?.didUpdate(gameState: endGame())
    }

    // End the game by setting the winning team and resetting the vars
    private func endGame() -> GameState {
        let finalHomeScore = homeScore
        let finalGuestScore = guestScore
        let winningTeam = finalHomeScore > finalGuestScore ? homeTeam : guestTeam

        reset()

        return GameState(homeTeamScore: finalHomeScore,
                         guestTeamScore: finalGuestScore,
                         scoringTeamName: winningTeam.name,
                         lastAction: "The game has ended. \(winningTeam.name.capitalized) win!!")
    }

    // Reset the game to a fresh start
    private func reset() {
        timer?.invalidate()
        homeScore = 0
        guestScore = 0
        possessionCount = 0
        homePossession = true
    }

    @objc private func runGameSimulator() {
        // Tell the delegate to update its state
        delegate?.didUpdate(gameState: progressGame())

        // every team gets 60 (120/2) ball possessions at max, after that the game is over
        guard possessionCount <= 120 else {
            delegate?.didCompleteGame()
            return
        }

        possessionCount += 1
    }

    private func progressGame() -> GameState {
        let pointsScored = Int.random(in: 0...3)
        // Add random homeScore or guestScore
        homePossession ? (homeScore += pointsScored) : (guestScore += pointsScored) // homePossession : guestPossession

        let lastAction = createLastActionString(scoringTeam: scoringTeam, pointsScored: pointsScored)

        // Capture scoring team before toggling possession
        let scoringTeamName = scoringTeam.name
        // Change from homePossession to guestPossession
        homePossession.toggle()

        return GameState(homeTeamScore: homeScore, guestTeamScore: guestScore, scoringTeamName: scoringTeamName, lastAction: lastAction)
    }

    // Create the action string which is shown in the view
    private func createLastActionString(scoringTeam: Team, pointsScored: Int) -> String {

        let scoringPlayer = scoringTeam.players.randomElement() ?? "Player"

        switch pointsScored {
            case 0:
                return scoringPlayer + " " + "missed a shot"
            case 1:
                return scoringPlayer + " " + "made 1 of 2 free throws"
            case 2:
                return scoringPlayer + " " + "lays it in for 2"
            case 3:
                return scoringPlayer + " " + "drains a 3"
            default:
                return scoringPlayer + " " + "had a 4 point play!"
        }
    }

}
