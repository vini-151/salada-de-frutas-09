//
//  tabViewTest.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 11/10/25.
//

import SwiftUI

struct tabViewTest: View {
        @State private var selectedTab = "Notificação"

        var body: some View {
            TabView(selection: $selectedTab) {
                notification()
                .tabItem {
                    Label("Notificação", systemImage: "bell")
                }
                .tag("One")

                ContentView()
                    .tabItem {
                        Label("EventKit", systemImage: "calendar")
                    }
                    .tag("Two")
                
                TimerView()
                    .tabItem {
                        Label("Timer", systemImage: "clock")
                    }
                    .tag("Three")
                

            }
        }
    
}

#Preview {
    tabViewTest()
}
