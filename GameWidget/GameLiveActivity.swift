//
//  GameLiveActivity.swift
//  GameWidget
//
//  Created by Simon Berner on 02.02.23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct GameLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GameAttributes.self) { context in
            // Lock screen/banner UI goes here
            LiveActivityView(context: context)

        } dynamicIsland: { context in // context: is the GameAttributes which for us is the GameState
            DynamicIsland {
                // Expanded UI of DI goes here.
                // Compose the expanded UI through various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    HStack {
                        Image(context.attributes.homeTeam)
                            .teamLogoModifier(frame: 40)
                            .contentTransition(.identity)

                        Text(context.state.gameState.homeTeamScore.description)
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    HStack {
                        Text(context.state.gameState.guestTeamScore.description)
                            .font(.title)
                            .fontWeight(.semibold)

                        Image(context.attributes.guestTeam)
                            .teamLogoModifier(frame: 40)
                            .contentTransition(.identity)
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        Image(context.state.gameState.scoringTeamName)
                            .teamLogoModifier(frame: 20)

                        Text(context.state.gameState.lastAction)
                    }
                }
                // We don't use the .center here
//                DynamicIslandExpandedRegion(.center) {
//                    Text("5:24 3Q")
//                }
                // Compact UI of DI goes here
            } compactLeading: {
                HStack {
                    Image(context.attributes.homeTeam)
                        .teamLogoModifier() // we don't give it a frame as we let the DA resize it to fit
                        .contentTransition(.identity)

                    Text(context.state.gameState.homeTeamScore.description)
                        .fontWeight(.semibold)
                }
            } compactTrailing: {
                HStack {
                    Image(context.attributes.guestTeam)
                        .teamLogoModifier() // we don't give it a frame as we let the DA resize it to fit
                        .contentTransition(.identity)

                    Text(context.state.gameState.guestTeamScore.description)
                        .fontWeight(.semibold)
                }
                // Minimal UI of DI goes here
            } minimal: {
                Image(context.state.gameState.scoringTeamName)
                    .teamLogoModifier()
                    .contentTransition(.identity)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

//struct GameWidgetLiveActivity_Previews: PreviewProvider {
//    static let attributes = GameAttributes(name: "Me")
//    static let contentState = GameAttributes.ContentState(value: 3)
//
//    static var previews: some View {
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
//            .previewDisplayName("Island Compact")
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
//            .previewDisplayName("Island Expanded")
//        attributes
//            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
//            .previewDisplayName("Minimal")
//        attributes
//            .previewContext(contentState, viewKind: .content)
//            .previewDisplayName("Notification")
//    }
//}
