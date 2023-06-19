//
//  Location.swift
//  Map
//
//  Created by Agnesa  on 23.5.23.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable{
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link : String
    let isItemFound: Bool
    
    var id: String{
        //name = "Colesoum"
        //cityname = "rome"
        name + cityName
    }
    static func  == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}


