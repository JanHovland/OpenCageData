//
//  GeoRecord.swift
//  OpenCageData
//
//  Created by Jan Hovland on 09/09/2022.
//

import Foundation

struct GeoRecord: Identifiable, Hashable  {
    var id = UUID()
    var latitude : Double?          // latitude  = breddegrad
    var longitude : Double?         // longitude = lengdegrad
    var flag = String()
    var type = String()
    var formatted = String()
    var searchString = String()
}

