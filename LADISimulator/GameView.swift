//
//  ContentView.swift
//  LADISimulator
//
//  Created by Simon Berner on 26.01.23.
//

import SwiftUI

struct GameView: View {
    @StateObject var model: GameModel

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                // Home Team: Golden State Warriors
                HStack {
                    Image(model.simulator.homeTeam.name)
                        .teamLogoModifier(frame: 80)
                    Text("\(model.gameState.homeTeamScore)")
                        .font(.system(size: 38, weight: .bold))
                }

                Spacer()

                // Guest Team: Chicago Bulls
                HStack {
                    Text("\(model.gameState.guestTeamScore)")
                        .font(.system(size: 38, weight: .bold))
                    Image(model.simulator.guestTeam.name)
                        .teamLogoModifier(frame: 80)
                }

            }
            .padding(20)

            // Who scores?
            HStack {
                Image(model.gameState.scoringTeamName)
                    .teamLogoModifier(frame: 20)

                Text(model.gameState.lastAction)
            }
            .font(.callout)
            .fontWeight(.semibold)
            .padding(.bottom, 40)

            // Buttons
            VStack(spacing: 12) {
                Button("Start Game Simulation") {
                    model.simulator.start()
                }
                .buttonStyle(ActionButton())


                Button("Start Live Activity") {
                    // TODO: launch live activity
                }
                .buttonStyle(ActionButton(color: .green))

                Button("End Sim & Live Activity") {
                    model.simulator.end()
                }
                .buttonStyle(ActionButton(color: .black))

            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(model: GameModel())
    }
}
