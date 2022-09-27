//
//  GeoRecord.swift
//  OpenCageData
//
//  Created by Jan Hovland on 09/09/2022.
//

import Foundation

struct GeoRecord: Identifiable, Hashable  {
    var id = UUID()
    var searchString = String()     // Varhaug
    var latitude : Double?          // latitude  = breddegrad
    var longitude : Double?         // longitude = lengdegrad
    var flag = String()
    var type = String()
    var formatted = String()        // Uelandsgata 2, 4360 Varhaug, Norge
    
    /// Reverse geocoding:
    
    var country = String()          // Norge
    var county = String()           // Rogaland
    var postalCity = String()       // Varhaug
    var village = String()          // Varhaug
}

