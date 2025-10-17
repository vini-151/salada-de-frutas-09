//
//  TimerView.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 16/10/25.
//

import SwiftUI
import ActivityKit

struct TimerView: View {
    @State private var isTrackingTime: Bool = false
    
    @State private var startTime: Date? = nil
    
    @State private var activity: Activity<TimerAtributtes>? = nil
    var body: some View {
        VStack {
            
            if let startTime{
                Text(startTime, style: .timer)
            }
            
            
            Text("Timer")
                .font(.largeTitle)
                .padding()
            
            Button {
                isTrackingTime.toggle()
                
                if isTrackingTime {
                    startTime = .now
                    
                    let attributes = TimerAtributtes()
                    let state = TimerAtributtes.ContentState(startTime: .now)
                    
                    activity = try? Activity<TimerAtributtes>.request(attributes: attributes, content: ActivityContent(state: state, staleDate: nil), pushType: nil)
                    
                    
                } else{
                    guard let startTime else { return }
                    let state = TimerAtributtes.ContentState(startTime: startTime)
                    
                    Task{
                        await activity?.end(ActivityContent(state: state, staleDate: nil), dismissalPolicy: .immediate)
                    }
                    
                    self.startTime = nil
                    
                    
                    
                }
                
                
            } label: {
                Text(startTime == nil ? "iniciar" : "parô parô")
            }
            
            
        }
        
    }
}

#Preview {
    TimerView()
}
