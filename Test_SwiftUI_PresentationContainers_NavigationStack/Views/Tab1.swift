//
//  Tab1.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 22/07/2022.
//

import SwiftUI

struct Tab1: View {
    var body: some View {
        NavigationStack {
            Text("Tab1 presents the simplest application of the navigation:\nNavigationLinks can push a destination view on the navigation stack. This doesn't give an opportunity for programatic navigation (only using BACK functionality is possible)")
                .font(.caption)
            List(1..<3) { rowNumber in
                NavigationLink("Row \(rowNumber) Link") {
                    
                    // NOTICE: NavigationLinks can be nested
                    NavigationLink(destination: { // NOTICE: you can choose between a few init functions (here is init(destinatio:..., label:...) used)
                        Text("Destination from row \(rowNumber) - layer 2")
                            .navigationTitle("Tab1 - layer 2") // NOTICE: You can change the navigation title
                    }, label: {
                        Text("Link to layer 2")
                    })
                    
                    Text("Destination from row \(rowNumber) - layer 1")
                        .padding()
                        .navigationTitle("Tab1 - layer 1") // NOTICE: You can change the navigation title
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
