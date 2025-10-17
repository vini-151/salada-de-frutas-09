//
//  eventKitTestIOSApp.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 09/10/25.
//

import SwiftUI

@main
struct eventKitTestIOSApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: CustomAppDelegate
    
    
    var body: some Scene {
        WindowGroup {
            tabViewTest()
                .onAppear {
                    appDelegate.app = self
                }
        }
    }
}
