//
//  Tab3.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 22/07/2022.
//

import SwiftUI

struct Cloth: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

struct Tab3: View {
    
    let clothes: [Cloth] = [
        .init(name: "T-shirt"),
        .init(name: "dress"),
        .init(name: "tie"),
        .init(name: "suit")
    ]
    
    @State private var path: [Cloth] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List(clothes) { cloth in
                NavigationLink(cloth.name, value: cloth)
            }
            .navigationDestination(for: Cloth.self) { cloth in
//                Text("Hierarchy level: \(path.count)") // this doesn't work... I don't know why...
                Text(cloth.name)
                Button("Push a suit on the nav hierarchy") {
                    path.append(Cloth(name: "suit"))
                    let _ = print("hej!")
                }
                .padding()
                Button("Push 2 levels up in the hierarchy") {
                    path.append(contentsOf: [Cloth(name: "socks"), Cloth(name: "trousers")])
                }
                Button("Go back to root in the nav hierarchy") {
                    path.removeAll()
                }
                .padding()
                .navigationTitle("Name of a cloth")
            }
        }
    }
}

struct Tab3_Previews: PreviewProvider {
    static var previews: some View {
        Tab3()
    }
}
