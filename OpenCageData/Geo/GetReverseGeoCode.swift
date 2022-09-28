//
//  GetReverseGeoCode.swift
//  OpenCageData
//
//  Created by Jan Hovland on 27/09/2022.
//

import Foundation

func GetReverseGeoCode(latitude: Double, longitude: Double, key: String, urlOpenCage: String) async -> ([GeoRecord]) {
    
    var openCage = OpenCage()
    var geoRecords = [GeoRecord]()
    
    let lat = "\(latitude)"
    let lon = "\(longitude)"

    let url = URL(string: urlOpenCage  + lat + "+" + lon + "&key=" + key)
    
/// https://api.opencagedata.com/geocode/v1/json?q=8.617510970430925.6450528933490896&key=96ce67ce6afa48f6a2fc8c624a80272c)
    
    
    print(url as Any)
    let urlSession = URLSession.shared
    
    do {
        let (data, _) = try await urlSession.data(from: url!)
        openCage = try JSONDecoder().decode(OpenCage.self, from: data)
        let count = openCage.results.count
        for i in 0..<count {
            var geoRecord = GeoRecord()
            
            if openCage.results[i].formatted != nil {
                geoRecord.formatted = openCage.results[i].formatted!
            } else {
                geoRecord.formatted = ""
            }
            
            print(geoRecord.formatted)
            
            if openCage.results[i].components.country != nil {
                geoRecord.country = openCage.results[i].components.country!
            } else {
                geoRecord.country = ""
            }

            print(geoRecord.country)

            if openCage.results[i].components.county != nil {
                geoRecord.county = openCage.results[i].components.county!
            } else {
                geoRecord.county = ""
            }

            print(geoRecord.county)

            if openCage.results[i].components.postalCity != nil {
                geoRecord.postalCity = openCage.results[i].components.postalCity!
            } else {
                geoRecord.postalCity = ""
            }

            print("PostalCity = \(geoRecord.postalCity)")

            if openCage.results[i].components.village != nil {
                geoRecord.village = openCage.results[i].components.village!
            } else {
                geoRecord.village = ""
            }

            print("Village = \(geoRecord.village)")
            
            geoRecords.append(geoRecord)
        }
        return geoRecords
    }
    catch {
        debugPrint(error)
        return geoRecords
    }
    
}
