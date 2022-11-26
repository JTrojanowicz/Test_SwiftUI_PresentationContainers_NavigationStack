//
//  ContentView.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 20/07/2022.
//

// https://betterprogramming.pub/a-first-look-at-swiftui-navigationstack-navigationpath-and-navigationdestination-3a9bbb300e08

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // NOTICE: I organize the project into TabViews because there cannot be NavigationStack inside another NavigationStack and I want to have a few independent branches of navigation.
        TabView {
            Tab1()
                .tabItem { Label("Tab1", systemImage: "1.square") }
            Tab2()
                .tabItem { Label("Tab2", systemImage: "2.square") }
            Tab3()
                .tabItem { Label("Tab3", systemImage: "3.square") }
            Tab4()
                .tabItem { Label("Tab4", systemImage: "4.square") }
            Tab5()
                .tabItem { Label("Tab5", systemImage: "5.square") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
