//
//  HeroesApp.swift
//  Heroes
//
//  Created by ksd on 10/03/2022.
//

import SwiftUI

@main
struct HeroesApp: App {
    @State private var myStateController = StateController()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(myStateController)
        }
    }
}
