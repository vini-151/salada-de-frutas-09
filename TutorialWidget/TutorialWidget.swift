//
//  TutorialWidget.swift
//  TutorialWidget
//
//  Created by Vini Oliveira  on 16/10/25.
//
import ActivityKit
import WidgetKit
import SwiftUI

struct TimerActivityView: View{
    let context: ActivityViewContext<TimerAtributtes>
    
    var body: some View{
        VStack(alignment: .center) {

            Text(context.state.startTime, style: .relative)
        }
        .padding(.horizontal)
    }
}


struct TutorialWidget: Widget {
    
    let kind: String = "TutorialWidget"
    
    
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerAtributtes.self) { context in
            TimerActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland{
                DynamicIslandExpandedRegion(.leading){
                    Text(context.state.startTime, style: .relative)
                }
            } compactLeading: {
                Image(systemName: "clock")
            } compactTrailing: {
                Text(context.state.startTime, style: .relative)
            } minimal: {
                Text(context.state.startTime, style: .relative)
            }
        }
    }
}

