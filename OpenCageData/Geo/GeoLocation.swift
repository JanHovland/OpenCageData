//
//  GeoLocation.swift
//  OpenCageData
//
//  Created by Jan Hovland on 09/09/2022.
//

import Foundation

func getGeoCode(city: String, key: String, urlOpenCage: String) async -> ([GeoRecord]) {
    
    var openCage = OpenCage()
    var geoRecords = [GeoRecord]()
    
    let url = URL(string: urlOpenCage + formatCity(city: city) + "&key=" + key)
    print(url as Any)
    let urlSession = URLSession.shared
    
    do {
        let (data, _) = try await urlSession.data(from: url!)
        openCage = try JSONDecoder().decode(OpenCage.self, from: data)
        let count = openCage.results.count
        for i in 0..<count {
            var geoRecord = GeoRecord()
            geoRecord.searchString = city
            if openCage.results[i].annotations.flag != nil {
                geoRecord.flag = openCage.results[i].annotations.flag!
            } else {
                geoRecord.flag = "🏳️"
            }
            if openCage.results[i].components.type != nil {
                geoRecord.type = openCage.results[i].components.type!
            } else {
                geoRecord.type = ""
            }
            
            if geoRecord.type == "city" { geoRecord.type = String(localized: "city") }
            if geoRecord.type == "railway" { geoRecord.type = String(localized: "railway") }
            if geoRecord.type == "village" { geoRecord.type = String(localized: "village") }
            if geoRecord.type == "hotel" { geoRecord.type = String(localized: "hotel") }
            if geoRecord.type == "hamlet" { geoRecord.type = String(localized: "hamlet") }
            if geoRecord.type == "farm" { geoRecord.type = String(localized: "farm") }
            if geoRecord.type == "place_of_worship" { geoRecord.type = String(localized: "place_of_worship") }
            if geoRecord.type == "body_of_water" { geoRecord.type = String(localized: "body_of_water") }
            if geoRecord.type == "building" { geoRecord.type = String(localized: "building") }
            if geoRecord.type == "continent" { geoRecord.type = String(localized: "continent") }
            if geoRecord.type == "country" { geoRecord.type = String(localized: "country") }
            if geoRecord.type == "county" { geoRecord.type = String(localized: "county") }
            if geoRecord.type == "fictitious" { geoRecord.type = String(localized: "fictitious") }
            if geoRecord.type == "island" { geoRecord.type = String(localized: "island") }
            if geoRecord.type == "neighbourhood" { geoRecord.type = String(localized: "neighbourhood") }
            if geoRecord.type == "partial_postcode" { geoRecord.type = String(localized: "partial_postcode") }
            if geoRecord.type == "postal_city" { geoRecord.type = String(localized: "postal_city") }
            if geoRecord.type == "postcode" { geoRecord.type = String(localized: "postcode") }
            if geoRecord.type == "region" { geoRecord.type = String(localized: "region") }
            if geoRecord.type == "road" { geoRecord.type = String(localized: "road") }
            if geoRecord.type == "state" { geoRecord.type = String(localized: "state") }
            if geoRecord.type == "state_district" { geoRecord.type = String(localized: "state_district") }
            if geoRecord.type == "terminated_postcode" { geoRecord.type = String(localized: "terminated_postcode") }
            if geoRecord.type == "unknown" { geoRecord.type = String(localized: "unknown") }
            if geoRecord.type == "waterway" { geoRecord.type = String(localized: "waterway") }
            if geoRecord.type == "craft" { geoRecord.type = String(localized: "craft") }
            if geoRecord.type == "boundary_stone" { geoRecord.type = String(localized: "boundary_stone") }


            if openCage.results[i].formatted != nil {
                let formatted = String(openCage.results[i].formatted!.prefix(40))
                geoRecord.formatted = formatted  
            } else {
                geoRecord.formatted = ""
            }
            if openCage.results[i].geometry.lat != nil {
                geoRecord.latitude = openCage.results[i].geometry.lat!
            }
            if openCage.results[i].geometry.lng != nil {
                geoRecord.longitude = openCage.results[i].geometry.lng!
            }
            geoRecords.append(geoRecord)
        }
        return geoRecords
    }
    catch {
        debugPrint(error)
        return geoRecords
    }
}

func formatCity(city: String) -> String {
    
/// https://www.utf8-chartable.de
    
    var fmCity : String = city
   
    fmCity = replaceChar(str: fmCity, from: " ", to: "%20")
    fmCity = replaceChar(str: fmCity, from: ",", to: "%2C")
    
    fmCity = replaceChar(str: fmCity, from: "æ", to: "%C3%A6")
    fmCity = replaceChar(str: fmCity, from: "Æ", to: "%C3%86")
    fmCity = replaceChar(str: fmCity, from: "ø", to: "%C3%B8")
    fmCity = replaceChar(str: fmCity, from: "Ø", to: "%C3%98")
    fmCity = replaceChar(str: fmCity, from: "å", to: "%C3%A5")
    fmCity = replaceChar(str: fmCity, from: "Å", to: "%C3%A5")
    
    fmCity = replaceChar(str: fmCity, from: "á", to: "%C3%A1")
    fmCity = replaceChar(str: fmCity, from: "ä", to: "%C3%A4")
    fmCity = replaceChar(str: fmCity, from: "à", to: "%C3%A0")
    fmCity = replaceChar(str: fmCity, from: "â", to: "%C3%A2")
    fmCity = replaceChar(str: fmCity, from: "ã", to: "%C3%A3")
    
    fmCity = replaceChar(str: fmCity, from: "ë", to: "%C3%85")
    fmCity = replaceChar(str: fmCity, from: "è", to: "%C3%A8")
    fmCity = replaceChar(str: fmCity, from: "é", to: "%C3%A9")
    fmCity = replaceChar(str: fmCity, from: "ê", to: "%C3%AA")
    fmCity = replaceChar(str: fmCity, from: "é", to: "%C3%9C")
    
    fmCity = replaceChar(str: fmCity, from: "ì", to: "%C3%AC")
    fmCity = replaceChar(str: fmCity, from: "í", to: "%C3%AD")
    fmCity = replaceChar(str: fmCity, from: "î", to: "%C3%AE")
    fmCity = replaceChar(str: fmCity, from: "ï", to: "%C3%AF")
    
    fmCity = replaceChar(str: fmCity, from: "ö", to: "%C3%B6")
    fmCity = replaceChar(str: fmCity, from: "ò", to: "%C3%B2")
    fmCity = replaceChar(str: fmCity, from: "ó", to: "%C3%B3")
    fmCity = replaceChar(str: fmCity, from: "ô", to: "%C3%B4")
    fmCity = replaceChar(str: fmCity, from: "õ", to: "%C3%B5")

    fmCity = replaceChar(str: fmCity, from: "ü", to: "%C3%BC")
    fmCity = replaceChar(str: fmCity, from: "ù", to: "%C3%B9")
    fmCity = replaceChar(str: fmCity, from: "ú", to: "%C3%BA")
    fmCity = replaceChar(str: fmCity, from: "û", to: "%C3%BB")
    
    fmCity = replaceChar(str: fmCity, from: "À", to: "%C3%80")
    fmCity = replaceChar(str: fmCity, from: "Á", to: "%C3%81")
    fmCity = replaceChar(str: fmCity, from: "Â", to: "%C3%82")
    fmCity = replaceChar(str: fmCity, from: "Ã", to: "%C3%83")
    fmCity = replaceChar(str: fmCity, from: "Ä", to: "%C3%84")
    
    fmCity = replaceChar(str: fmCity, from: "È", to: "%C3%88")
    fmCity = replaceChar(str: fmCity, from: "É", to: "%C3%89")
    fmCity = replaceChar(str: fmCity, from: "Ê", to: "%C3%8A")
    fmCity = replaceChar(str: fmCity, from: "Ë", to: "%C3%8B")
    
    fmCity = replaceChar(str: fmCity, from: "Ì", to: "%C3%8C")
    fmCity = replaceChar(str: fmCity, from: "Í", to: "%C3%8D")
    fmCity = replaceChar(str: fmCity, from: "Î", to: "%C3%8E")
    fmCity = replaceChar(str: fmCity, from: "Ï", to: "%C3%8F")
    
    fmCity = replaceChar(str: fmCity, from: "Ò", to: "%C3%92")
    fmCity = replaceChar(str: fmCity, from: "Ó", to: "%C3%93")
    fmCity = replaceChar(str: fmCity, from: "Ô", to: "%C3%94")
    fmCity = replaceChar(str: fmCity, from: "Õ", to: "%C3%95")
    fmCity = replaceChar(str: fmCity, from: "Ö", to: "%C3%96")
    
    fmCity = replaceChar(str: fmCity, from: "Ù", to: "%C3%99")
    fmCity = replaceChar(str: fmCity, from: "Ú", to: "%C3%9A")
    fmCity = replaceChar(str: fmCity, from: "Û", to: "%C3%9B")
    fmCity = replaceChar(str: fmCity, from: "Ü", to: "%C3%9C")
    
    fmCity = replaceChar(str: fmCity, from: "ß", to: "%C3%9F")
    
    return fmCity
}

func replaceChar(str: String, from: String, to: String) -> String {
    return str.replacingOccurrences(of: from, with: to)
}

