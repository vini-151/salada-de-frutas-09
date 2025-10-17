//
//  ContentView.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 09/10/25.
//

import SwiftUI
import EventKit

struct ContentView: View {
    
    @State var mostarModalEvento: Bool = false
    


    
    var body: some View {
        VStack {
            Button{
                mostarModalEvento.toggle()
            } label: {
                Text("Criar evento no calendário!")
            }
            .buttonStyle(.glassProminent)
            .sheet(isPresented: $mostarModalEvento, content: {
                AddEvent()
            })
            
            
            Button{
                criarReminders()
            } label: {
                Text("adicionar reminder")
            }.buttonStyle(.glass)
            
       
            
        }
        .padding()
    }
    
    func criarReminders(){
        let event = EKEventStore()
        event.requestFullAccessToReminders { (granted, error) in
            if granted {
                let novoReminder = EKReminder(eventStore: event)
                novoReminder.title = "teste"
                novoReminder.priority = 1
                
                var dateComponents = DateComponents()
                dateComponents.year = 2025
                dateComponents.month = 10
                dateComponents.day = 10
                dateComponents.hour = 16
                dateComponents.minute = 0
                novoReminder.dueDateComponents = dateComponents
                novoReminder.calendar = event.defaultCalendarForNewReminders()!
                
                do{
                    try event.save(novoReminder, commit: true)
                    print("reminder adicionado!")
                }catch{
                    print("deu ruim fi")
                }
                
            }else{
                print(error?.localizedDescription ?? "erro desconhecido")
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
