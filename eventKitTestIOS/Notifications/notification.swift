//
//  notification.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 13/10/25.
//

import Foundation
import SwiftUI
import UserNotifications

struct notification: View {
    var body: some View {
        VStack {
            Button("Pedir permissão") {
                requestNotification()
            }
            .buttonStyle(.glassProminent)

            Button("Agendar notificação") {
                sendNotification()
            }
            .buttonStyle(.glass)
        }
    }
    func requestNotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Minha incrível notificação"
        content.subtitle = "Olha o subtitle aqui"
        content.badge = 1
        content.sound = UNNotificationSound.default

  
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)


        UNUserNotificationCenter.current().add(request)

        
        
    }
    
    
}

#Preview {
    notification()
}
