//
//  ContentView.swift
//  Heroes
//
//  Created by ksd on 10/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: StateController
    
    private var heroList: [Hero] {
        appState.heroList
    }
    
    var body: some View {
        NavigationView {
            List(heroList) { hero in
                NavigationLink(
                    destination: HeroDetail(hero: hero)) {
                        HeroRow(hero: hero)
                    }
            }.navigationTitle("Heroes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StateController())
    }
}
