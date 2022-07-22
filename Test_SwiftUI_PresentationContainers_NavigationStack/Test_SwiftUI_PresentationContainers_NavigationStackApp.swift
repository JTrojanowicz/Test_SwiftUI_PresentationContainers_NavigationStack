//
//  Test_SwiftUI_PresentationContainers_NavigationStackApp.swift
//  Test_SwiftUI_PresentationContainers_NavigationStack
//
//  Created by Jaroslaw Trojanowicz on 20/07/2022.
//

import SwiftUI

// links:
// https://www.hackingwithswift.com/articles/250/whats-new-in-swiftui-for-ios-16
// https://www.youtube.com/watch?v=dZdHJQT7Z4Y


final class Router: ObservableObject {
    @Published var path = NavigationPath()
}

@main
struct Test_SwiftUI_PresentationContainers_NavigationStackApp: App {
    
    let router = Router()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
