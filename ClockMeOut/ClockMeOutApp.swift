//
//  ClockMeOutApp.swift
//  ClockMeOut
//
//  Created by Adrián Pisabarro García on 17/10/23.
//

import SwiftUI

@main
struct ClockMeOutApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
             //   .environment(\.managedObjectContext, persistenceController.container.viewContext)
            TabBar()
        }
    }
}
