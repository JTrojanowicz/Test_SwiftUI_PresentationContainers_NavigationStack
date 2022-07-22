//
//  ContentView.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 20/07/2022.
//

// https://betterprogramming.pub/a-first-look-at-swiftui-navigationstack-navigationpath-and-navigationdestination-3a9bbb300e08

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        
        TabView {
            Tab1()
                .tabItem { Label("Tab1", systemImage: "1.square") }
            Tab2()
                .tabItem { Label("Tab2", systemImage: "2.square") }
            Tab3()
                .tabItem { Label("Tab3", systemImage: "3.square") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let router = Router()
    
    static var previews: some View {
        ContentView()
            .environmentObject(router)
    }
}
