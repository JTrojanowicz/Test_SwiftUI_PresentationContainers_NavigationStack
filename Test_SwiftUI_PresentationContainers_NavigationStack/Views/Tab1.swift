//
//  Tab1.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 22/07/2022.
//

import SwiftUI

/*
 This is the simplest application of NavigationStack
 */

struct Tab1: View {
    var body: some View {
        NavigationStack {
            List(1..<3) { i in
                NavigationLink("Row \(i) Link") {
                    // NOTICE: Second layer is pushed on the first layer but without animation and without updating the Back button (it looks like this method can be used only when navigating to layer 1)
                    NavigationLink("Link to layer 2") {
                        Text("Destination from row \(i) - layer 2")
                        // NOTICE: You still CAN change the navigation title
                            .navigationTitle("Tab1 - layer 2")
                    }
                    Text("Destination from row \(i) - layer 1")
                    // NOTICE: You can change the navigation title
                        .navigationTitle("Tab1 - layer 1")
                }
            }
            
            // NOTICE: Text in the NavigationLink outside List becomes a button-like
            NavigationLink("Text outside List") {
                Text("Destination from Text outside List")
                    .navigationTitle("Tab1 - layer 1")
            }
            .padding()
            
            NavigationLink {
                Text("Destination from Label")
                    .navigationTitle("Tab1 - layer 1")
            } label: {
                Label("Label outside List", systemImage: "globe")
            }
            .padding()
            
            // NOTICE: navigation title needs to be inside navigation stack
            .navigationTitle("Tab1 - layer 0")
        }
    }
}

struct Tab1_Previews: PreviewProvider {
    static var previews: some View {
        Tab1()
    }
}
