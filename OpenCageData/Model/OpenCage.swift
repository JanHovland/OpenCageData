//
//  OpenCage.swift
//  OpenCageData
//
//  Created by Jan Hovland on 02/09/2022.
//

import Foundation

struct OpenCage: Decodable {
    var results = [Result()]
}
    
struct Result: Decodable {
    var annotations = Annotations()
    var components = Components()
    var formatted : String?
    var geometry = Geometry()
}

struct Components: Decodable {
    var type : String?
    var country: String?
    var county: String?
    var postalCity: String?
    var village: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case country
        case county
        case postalCity = "postal_city"
        case village
    }
}

struct Annotations: Decodable {
    var flag : String?
}

struct Geometry: Decodable {
    var lat: Double?                // latitude  = breddegrad = 0 meredian går gjennom greenwich
    var lng: Double?                // longitude = lengdegrad
}


