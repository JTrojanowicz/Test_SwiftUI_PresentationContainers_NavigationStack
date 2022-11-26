//
//  Tab3.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 22/07/2022.
//

import SwiftUI

struct Cloth: Identifiable, Hashable {
    var id: String { return name } // to conform with Identifiable protocol
    var name: String
}

struct Tab3: View {
    
    let clothes: [Cloth] = [
        .init(name: "T-shirt"),
        .init(name: "dress"),
        .init(name: "tie"),
        .init(name: "suit")
    ]
    
    @State private var path: [Cloth] = [] // when the destination views are based on the same value, the navigation path can be just an array of those values (simple form).
    
    var body: some View {
        NavigationStack(path: $path) {
            Text("Tab3 presents the functionality of .navigationDestination modifier and (simple) navigation path. This gives a power of programatic navigation.")
                .font(.caption)
            
            List(clothes) { cloth in
                NavigationLink(cloth.name, value: cloth)
            }
            
            // .navigationDestination needs to be inside NavigationStack or NavigationSplitView
            .navigationDestination(for: Cloth.self) { cloth in
                NavTestView(navigationPath: $path)                
            }
            
            .navigationTitle("Tab3")
        }
        .onChange(of: path, perform: onChangePath)
    }
    
    private func onChangePath(path: [Cloth]) {
        print("path.counter = \(path.count)") //just to observe what is happening with the path
    }
}

struct Tab3_Previews: PreviewProvider {
    static var previews: some View {
        Tab3()
    }
}
