//
//  Tab2.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 22/07/2022.
//

import SwiftUI

struct Company: Identifiable , Hashable {
    // we make it Identifiable so that it is better used in List or ForEach
    // we make it Hashable to use it in NavigationLink(value: Hashable)
    var id = UUID()
    var name: String
}

struct Tab2: View {
    
    let companies: [Company] = [
        .init(name: "Apple"),
        .init(name: "Intel"),
        .init(name: "Facebook"),
        .init(name: "Microsoft")
    ]
    
    var body: some View {
        NavigationStack {
            Text("Tab2 presents the functionality of .navigationDestination modifier.\nIn this case NavigationLink does not contain the destination view, but it contains value which .navigationDestination modifier recognises and pushes on the navigationDestination appropriate destinationview")
                .font(.caption)
            
            List(1..<4) { i in
                HStack {
                    Text("Text") // text will also be "tapable" when the NavigationLink appears in the row
                    NavigationLink(value: i) {
                        Label("Row \(i) (link)", systemImage: "globe")
                        Text("Text2")
                    }
                }
            }
            
            NavigationLink(value: 1.0) {
                Text("Text outside List (link)")
            }
            
            NavigationLink("Red", value: Color.red)
            
            List(companies) { company in
                NavigationLink(company.name, value: company)
            }
            
            // NOTICE:
            // .navigationDestination provides the destination from the NavigationLink(value:). It differentiates the NavigationLinks by their "values"
            // .navigationDestination can be used anywhere in the view BUT it must be used in the same view (inside) NavigationStack. It is recommended to use it outside of lazy views (but still inside its NavigationStack)
            // you can build a navigation stack (a navigation "tree" with "branches") by the usage of .navigationDestination modifiers provided at the root view or NavigationStack
            // see: https://www.hackingwithswift.com/articles/250/whats-new-in-swiftui-for-ios-16
            // "That might seem little different from what we had before, but this new approach to navigation makes it much easier to create deep links, to handle state restoration, and also to jump to arbitrary places in our navigation – perhaps to push several views at once, or to pop all our views and return to the root."
            .navigationDestination(for: Int.self) { i in
                // NOTICE: Here is the destination view:
                
                // NOTICE: This navigation also triggers appropriate .navigationDestination modifier (it doesn't care that it is inside one of them) -- if used this way it will provide endless number of views that can be pushed onto navigation stack
                NavigationLink(value: i) {
                    Text("Link to layer 2")
                }
                Text("Destination from row \(i)")
                    .navigationTitle("Tab2 - layer 1")
            }
            
            .navigationDestination(for: Double.self) { d in
                NavigationLink(value: d) {
                    Text("Link to layer 2")
                }
                Text("Destination by value: \(d)")
                    .navigationTitle("Tab2 - layer 1")
            }
            
            .navigationDestination(for: Color.self) { color in
                Text("Destination View with appropriate background color")
                    .background(color)
            }
            
            .navigationDestination(for: Company.self) { company in
                Text(company.name)
                    .navigationTitle("Company name")
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
