//
//  ContentView.swift
//  userNotificationExample
//
//  Created by Vadiraj Hippargi on 1/19/20.
//  Copyright © 2020 Vadiraj Hippargi. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack{
            Button("Request Permssion"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success ,  error ) in
                    if success {
                        print("allSet")
                    }else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                
            }
            
          Button("Send Notification"){
            
            let content = UNMutableNotificationContent()
            content.title = " Feed The Cat"
            content.subtitle = "Cat is Hungry"
            content.sound  = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
                       
                   }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
