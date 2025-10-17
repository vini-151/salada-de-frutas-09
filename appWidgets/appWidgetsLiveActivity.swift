//
//  appWidgetsLiveActivity.swift
//  appWidgets
//
//  Created by Vini Oliveira  on 09/10/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct appWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct appWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: appWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
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
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension appWidgetsAttributes {
    fileprivate static var preview: appWidgetsAttributes {
        appWidgetsAttributes(name: "World")
    }
}

extension appWidgetsAttributes.ContentState {
    fileprivate static var smiley: appWidgetsAttributes.ContentState {
        appWidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: appWidgetsAttributes.ContentState {
         appWidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: appWidgetsAttributes.preview) {
   appWidgetsLiveActivity()
} contentStates: {
    appWidgetsAttributes.ContentState.smiley
    appWidgetsAttributes.ContentState.starEyes
}
