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
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in // context: is the GameAttributes which for us is the GameState
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("Center")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
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
