//
//  tipKitTest.swift
//  eventKitTestIOS
//
//  Created by Vini Oliveira  on 13/10/25.
//

import Foundation
import SwiftUI
import TipKit

struct FavoriteLandmarkTipp: Tip {
    var title: Text {
        Text("Save as a Favorite")
    }


    var message: Text? {
        Text("Your favorite landmarks always appear at the top of the list.")
    }


    var image: Image? {
        Image(systemName: "star")
    }
    

}


struct tipKitTest: View {
    var favoriteLandmarkTipp = FavoriteLandmarkTipp()


       var body: some View {
  
               VStack {



                   Image(systemName: "star")
                       .imageScale(.large)
                       .popoverTip(favoriteLandmarkTipp, arrowEdge: .top)
                   Spacer()
               }
               .task {
                   // Configure and load your tips at app launch.
                   do {
                       try Tips.configure()
                   }
                   catch {
                       // Handle TipKit errors
                       print("Error initializing TipKit \(error.localizedDescription)")
                   }
               }
           
       }
}

#Preview {
    tipKitTest()
        .task {
            try? Tips.resetDatastore()
            
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
