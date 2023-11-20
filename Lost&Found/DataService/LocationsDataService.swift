//
//  LocationService.swift
//  Lost&Found
//
//  Created by Agnesa  on 23.5.23.
//


import Foundation
import MapKit

class LocationsDataService {

    static let locations: [Location] = [
        Location(
            name: "Royal Mall",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.6538550648155, longitude: 21.178214874782483),
            description: "The lost wallet was a weathered companion, its leather worn and faded, revealing traces of past adventures. Inside, it held a collection of essential cards, faded photographs, and fragments of memories yearning to be found once more.",
            imageNames: [
                "wallet1",
                "wallet2",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum",
            isItemFound: false),
        Location(
            name: "Fushë Kosovë",
            cityName: "Prishtina",
            coordinates: CLLocationCoordinate2D(latitude: 42.639553, longitude:  21.082757),
            description: "A precious ring of sentimental value. The ring is a gold band adorned with a sparkling diamond. It holds deep personal significance and cherished memories. A heartfelt reward is offered for its safe return.",
            imageNames: [
                "ring1",
                "ring2",
                "ring3",
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome",
            isItemFound: false),
        Location(
            name: "Dragodan",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.675031, longitude: 21.215469),
            description: "A cherished dog, a beloved member of the family. The dog is a small breed with brown fur and a white patch on the chest. It holds immense sentimental value, and our hearts yearn for its safe return. A substantial reward is offered for any information leading to its reunion. ",
            imageNames: [
                "dog1",
                "dog2",
                "dog3",
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain", isItemFound: false),
        Location(
            
            name: "Stadiumi 'Fadil Vokrri'",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.663406, longitude:  21.158218),
            description: "An iPhone 11 Pro, a sleek and powerful smartphone. The phone is  midnight green with 64GB storage]. It holds essential personal information and valuable memories. A generous reward awaits its safe return.",
            imageNames: [
                "iphone1",
                "iphone2",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower", isItemFound: false),
        Location(
            name: "Stacioni i autobusave",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.647907, longitude: 21.151756),
            description: "The lost wallet was a weathered companion, its leather worn and faded, revealing traces of past adventures. Inside, it held a collection of essential cards, faded photographs, and fragments of memories yearning to be found once more.",
            imageNames: [
                "wallet_1",
                "wallet_2",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre", isItemFound: false),
        Location(
            name: "Rruga 'Motrat Qiriazi'",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.647907, longitude: 21.151756),
            description: "A set of car keys belonging to a Honda Civic. They are of great significance for daily mobility. A reward is available for their safe return.",
            imageNames: [
                "key1",
                "key2",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre", isItemFound: false),
    ]
    
}

