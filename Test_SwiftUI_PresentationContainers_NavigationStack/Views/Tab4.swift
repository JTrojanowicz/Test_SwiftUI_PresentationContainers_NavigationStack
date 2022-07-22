//
//  Tab4.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 22/07/2022.
//

import SwiftUI

class NavRouter: ObservableObject {
    @Published var path = NavigationPath()
}

struct Tab4: View {
    
    @StateObject var navRouter = NavRouter()
    
    var body: some View {
        NavigationStack(path: $navRouter.path) {
            Text("Hello!")
        }
    }
}

struct Tab4_Previews: PreviewProvider {
    static var previews: some View {
        Tab4()
    }
}
