//
//  HeroRow.swift
//  Heroes
//
//  Created by ksd on 10/03/2022.
//

import SwiftUI

struct HeroRow: View {
    
    let hero: Hero
    
    var body: some View {
        HStack {
            Text(hero.name)
            if hero.isFavorite {
                Spacer()
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}

