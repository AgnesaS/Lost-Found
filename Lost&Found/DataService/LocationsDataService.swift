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
            description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
            imageNames: [
                "wallet",
                "keys",
                "rome-colosseum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "Newborn",
            cityName: "Prishtina",
            coordinates: CLLocationCoordinate2D(latitude: 42.660650, longitude: 21.157737),
            description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
            imageNames: [
                "wallet",
                "rome-pantheon-2",
                "rome-pantheon-3",
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
        //42.675031, 21.215469 parku i germise
        Location(
            name: "Parku i Germise",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.675031, longitude: 21.215469),
            description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
            imageNames: [
                "wallet",
                "rome-trevifountain-2",
                "rome-trevifountain-3",
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            
            name: "Stadiumi 'Fadil Vokrri'",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.663406, longitude:  21.158218),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed 'La dame de fer', it was constructed from 1887 to 1889 as the centerpiece of the 1889 World's Fair and was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognizable structures in the world.",
            imageNames: [
                "wallet",
                "paris-eiffeltower-2",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(
            name: "Stacioni i autobusave",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.647907, longitude: 21.151756),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "wallet",
                "paris-louvre-2",
                "paris-louvre-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
        Location(
            name: "Rruga 'Motrat Qiriazi'",
            cityName: "Prishtine",
            coordinates: CLLocationCoordinate2D(latitude: 42.647907, longitude: 21.151756),
            description: "Pershendetje! Keta qelsa jan gjet te rruga Motrat Qiriazi afer shkolles Hasan Prishtina, kujtdo qe i kan humb mundet me u lajmru te Barnatorja Matkos Pharm i kam dorzu aty",
            imageNames: [
                "keys",
                "paris-louvre-2",
                "paris-louvre-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
    ]
    
}

