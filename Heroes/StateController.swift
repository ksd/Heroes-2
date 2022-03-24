//
//  StateController.swift
//  Heroes
//
//  Created by ksd on 10/03/2022.
//

import Foundation
import CoreLocation


class StateController: ObservableObject {
    @Published var heroList = [
        Hero(name: "Iron-man", isFavorite: false, latitude: 56.1190901, longitude: 10.14737),
        Hero(name: "Aquaman", isFavorite: false, latitude: 56.1566254, longitude: 10.2072722),
        Hero(name: "Spiderman", isFavorite: true, latitude: 56.1554797, longitude: 10.197531),
        Hero(name: "Dr. Manhatten", isFavorite: true, latitude: 56.135671, longitude: 10.15775),
        Hero(name: "Superman", isFavorite: false, latitude: 56.19834, longitude: 10.20000)
    ]
    
    func heroLocation(for hero: Hero) -> HeroAnnotation {
        HeroAnnotation(id: hero.id,
                       name: hero.name,
                       coordinate: CLLocationCoordinate2D(
                        latitude: hero.latitude,
                        longitude: hero.longitude))
    }
    
}

struct HeroAnnotation: Identifiable {
    let id: String
    let name: String
    let coordinate: CLLocationCoordinate2D
}
