//
//  NavTestView.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 26/11/2022.
//

import SwiftUI

struct NavTestView: View {
    
    @Binding var navigationPath: [Cloth]
    let title: String
    
    init(navigationPath: Binding<[Cloth]>) {
        _navigationPath = navigationPath
        if let name = navigationPath.last?.wrappedValue.name {
            self.title = name
        } else {
            self.title = "Name"
        }
    }
    
    var body: some View {
        VStack {
            // NOTICE: you can push a new view on the either by using NavigationLink or by appending to the navigation path
            NavigationLink("Push a shirt on the top", value: Cloth(name: "shirt"))
            
            Button("Push a suit on the nav hierarchy") {
                navigationPath.append(Cloth(name: "suit"))
                let _ = print("hej!")
            }
            .padding()
            
            Button("Push 2 levels up in the hierarchy (socks and trousers)") {
                navigationPath.append(contentsOf: [Cloth(name: "socks"), Cloth(name: "trousers")])
            }
            .padding()
            
            Button("Go one level back") {
                navigationPath.removeLast()
            }
            
            Button("Go back to root in the nav hierarchy") {
                navigationPath.removeAll()
            }
            .padding()
            
//            .navigationTitle("Nav. layer: \(navigationPath.count)")
        }
    }
}

struct NavTestView_Previews: PreviewProvider {
    @State static private var navigationPath = [Cloth]()
    static var previews: some View {
        NavTestView(navigationPath: $navigationPath)
    }
}
