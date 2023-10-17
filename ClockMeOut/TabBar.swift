//
//  TabBar.swift
//  ClockMeOut
//
//  Created by Adrián Pisabarro García on 17/10/23.
//

import SwiftUI

struct TabBar: View {
    init() {
        UITabBar.appearance().tintColor = UIColor.orange
    }
    
    @State private var selectedTab = 0
        
    var body: some View {
        TabView(selection: $selectedTab) {
            CountdownView()
                .tabItem {
                    VStack {
                        Image(systemName: "timer")
                            .foregroundColor(.red)
                        Text("Countdown")
                    }
                }
                .tag(0)
            
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("List of Countdowns")
                    }
                }
                .tag(1)
        }.accentColor(.orange)
    }
}


#Preview {
    TabBar()
}
