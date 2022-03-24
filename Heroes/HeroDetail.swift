//
//  HeroDetail.swift
//  Heroes
//
//  Created by ksd on 10/03/2022.
//

import SwiftUI
import MapKit

struct HeroDetail: View {
    
    @EnvironmentObject var stateController: StateController
    @StateObject var locationState: LocationController
    let hero: Hero
    
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 56.1554797,
            longitude: 10.197531),
        latitudinalMeters: 150,
        longitudinalMeters: 150)
    
    var body: some View {
        Map(
            coordinateRegion: $locationState.coordinateRegion,
            showsUserLocation: true,
            annotationItems: stateController.heroList) { hero in
            MapAnnotation(coordinate: stateController.heroLocation(for: hero).coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                HeroMapDetail(title: hero.name)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            //coordinateRegion.center = stateController.heroLocation(for: hero).coordinate
            locationState.checkIfLocationServiceIsEnabled()
            locationState.locationManager?.startUpdatingLocation()
        }
        .onDisappear {
            locationState.locationManager?.stopUpdatingLocation()
        }
    }
}

struct HeroDetail_Previews: PreviewProvider {
    static var previews: some View {
        HeroDetail(locationState: LocationController(),
                   hero: StateController().heroList[2]).environmentObject(StateController())
    }
}
