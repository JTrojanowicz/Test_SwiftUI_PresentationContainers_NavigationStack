//
//  Tab2.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 22/07/2022.
//

import SwiftUI

struct Tab2: View {
    var body: some View {
        NavigationStack {
            List(1..<4) { i in
                NavigationLink(value: i) {
                    Label("Row \(i) (link)", systemImage: "globe")
                }
            }
            
            NavigationLink(value: 1.0) {
                Text("Text outside List (link)")
            }
            .padding()
            
            // NOTICE: .navigationDestination can be used anywhere in the view BUT it must be used in the same view (inside) NavigationStack
            .navigationDestination(for: Int.self) { i in
                NavigationLink(value: i) {
                    Text("Link to layer 2")
                }
                Text("Destination from row \(i)")
                    .navigationTitle("Tab2 - layer 1")
            }
            
            .navigationTitle("Tab2 - layer 0")
        }
    }
}

struct Tab2_Previews: PreviewProvider {
    static var previews: some View {
        Tab2()
    }
}
