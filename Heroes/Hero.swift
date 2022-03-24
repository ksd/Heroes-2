//
//  Hero.swift
//  Heroes
//
//  Created by ksd on 10/03/2022.
//

import Foundation

struct Hero: Identifiable {
    let id = UUID().uuidString
    let name: String
    let isFavorite: Bool
    let latitude: Double
    let longitude: Double
    
}


