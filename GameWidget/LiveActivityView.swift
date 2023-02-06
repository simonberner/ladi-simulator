//
//  LiveActivityView.swift
//  GameWidgetExtension
//
//  Created by Simon Berner on 03.02.23.
//

import SwiftUI
import WidgetKit

struct LiveActivityView: View {

    let context: ActivityViewContext<GameAttributes>

    var body: some View {
        ZStack {
            Image("activity-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay {
                    ContainerRelativeShape()
                        .fill(.black.opacity(0.4).gradient)
                }
                .contentTransition(.identity)

            VStack(spacing: 16) {
                HStack {
                    Image(context.attributes.homeTeam)
                        .teamLogoModifier(frame: 60)
                        .contentTransition(.identity)
                    Text(context.state.gameState.homeTeamScore.description)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white.opacity(0.8))
//                        .frame(width: 80, height: 80, alignment: .leading)

                    Spacer()

                    Text(context.state.gameState.guestTeamScore.description)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
//                        .frame(width: 80, height: 80, alignment: .trailing)
                    Image(context.attributes.guestTeam)
                        .teamLogoModifier(frame: 60)
                        .contentTransition(.identity)
                }

                HStack {
                    Image(context.state.gameState.scoringTeamName)
                        .teamLogoModifier(frame: 20)
                    Text(context.state.gameState.lastAction)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.9))
                }
            }
            .padding()
        }
    }
}

//struct LiveActivityview_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveActivityView()
//            .previewContext(WidgetPreviewContext(family: .systemMedium))
//    }
//}
