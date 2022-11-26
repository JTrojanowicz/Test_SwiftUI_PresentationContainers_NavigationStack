//
//  Tab5.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 06/09/2022.
//

import SwiftUI

protocol Navigationable {
    var id: UUID { get }
}

struct MyView1: View, Navigationable {
    var id = UUID()
    var body: some View {
        Text("MyView1")
    }
}


struct MyView2: View, Navigationable {
    var id = UUID()
    var body: some View {
        Text("MyView2")
    }
}

struct Tab5: View {
    
    @State private var path: [Navigationable] = []
    
    var body: some View {
//        NavigationStack(path: $path) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
    }
}

struct Tab5_Previews: PreviewProvider {
    static var previews: some View {
        Tab5()
    }
}
