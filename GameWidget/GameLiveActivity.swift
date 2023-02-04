//
//  GameLiveActivity.swift
//  GameWidget
//
//  Created by Simon Berner on 02.02.23.
//

import ActivityKit
import WidgetKit
import SwiftUI

// Put in the GameState here
struct GameAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var gameState: GameState
    }

    // Fixed non-changing properties about your activity go here!
    var homeTeam: String
    var guestTeam: String
}

struct GameLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: GameAttributes.self) { context in
            // Lock screen/banner UI goes here
            LiveActivityView()

        } dynamicIsland: { context in // context: is the GameAttributes which for us is the GameState
            DynamicIsland {
                // Expanded UI of DI goes here.
                // Compose the expanded UI through various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    HStack {
                        Image("warriors")
                            .teamLogoModifier(frame: 40)

                        Text("100")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    HStack {
                        Text("99")
                            .font(.title)
                            .fontWeight(.semibold)

                        Image("bulls")
                            .teamLogoModifier(frame: 40)
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        Image("warriors")
                            .teamLogoModifier(frame: 20)

                        Text("Mahalia Jackson smashes a 9!")
                    }
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("5:24 3Q")
                }
                // Compact UI of DI goes here
            } compactLeading: {
                HStack {
                    Image("warriors")
                        .teamLogoModifier() // we don't give it a frame as we let the DA resize it to fit

                    Text("100")
                        .fontWeight(.semibold)
                }
            } compactTrailing: {
                HStack {
                    Image("bulls")
                        .teamLogoModifier() // we don't give it a frame as we let the DA resize it to fit

                    Text("77")
                        .fontWeight(.semibold)
                }
                // Minimal UI of DI goes here
            } minimal: {
                // TODO: Show the image of the winner team
                Image("warriors")
                    .teamLogoModifier()
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
