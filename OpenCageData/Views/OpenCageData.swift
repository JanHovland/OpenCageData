//
//  OpenCage.swift
//  OpenCageData
//
//  Created by Jan Hovland on 02/09/2022.
//

/// App Sandbox:  Outgoing connection (Client) må være på
/// Weatherkit + Chart : https://www.youtube.com/watch?v=PAPgcSpSpcs

import SwiftUI


enum Category: Int, Hashable, CaseIterable, Identifiable, Codable {
    case openCage
    case setting
    
    var id: Int { rawValue }
    
    var localizedName: String {
        switch self {
        case .openCage:
            return "OpenCage"
        case .setting:
            return "Setting"
        }
    }
}

/// Navigation CookBook: https://developer.apple.com/videos/play/wwdc2022/10054

struct OpenCageData: View {
    
    var body: some View {
        
        VStack {
            Text("Meridian er en linje som går fra pol til pol og som står vinkelrett på ekvator. Lengdegrader, som brukes i geografiske koordinater.")
        }
        .font(.footnote)
        .padding(.horizontal)
        .padding(.top, 50)
        
#if os(iOS)
        NavigationStack {
            List(Category.allCases) { category in
                NavigationLink(category.localizedName, destination: DetailView(selection: category.localizedName))
            }
        }
#elseif os(macOS)
        NavigationView {
            List(Category.allCases) { category in
                NavigationLink(category.localizedName, destination: DetailView(selection: category.localizedName))
            }
        }
#endif
    }
}

struct DetailView: View {
    
    var selection : String
    
    var body: some View {
        NavigationStack {
            if selection == "OpenCage" {
                OpenCageView()
            } else if selection == "Setting"{
                SettingView()
            }
        }
    }
}

// struct OpenCageView: View {
//struct OpenCageView: View {
//    var body: some View {
//        NavigationStack {
//            Text("Testing of applications")
//                .toolbar {
//                    ToolbarItem(placement: .primaryAction) {
//                        Button("") {  }
//                    }
//
//                    ToolbarItem(placement: .secondaryAction) {
//                        Button("Settings") {  }
//                    }
//
//                }
//
//        }
//        .navigationTitle("OpenCage")
//    }
//}

struct OpenCageView: View {
    
    @State private var geoRecords = [GeoRecord()]
    @State private var indicatorShowing = false
    
    var body: some View {
        VStack {
            ActivityIndicator(isAnimating: $indicatorShowing, style: .medium, color: .gray)
            GeoRecordView(geoRecords: geoRecords, lonLat: false)
        }
        .padding()
        .task {
//            let city = formatCity(city: "Münich") // "Greenwich-observatoriet")
            let city = "Münich" // "Greenwich-observatoriet")
            let key = UserDefaults.standard.object(forKey: "KeyOpenCage") as? String ?? ""
            let urlOpenCage = UserDefaults.standard.object(forKey: "UrlOpenCage") as? String ?? ""
            indicatorShowing = true
            geoRecords = await getGeoCode(city: city, key: key, urlOpenCage: urlOpenCage)
            indicatorShowing = false
        }
        .navigationTitle("OpenCage")
    }
}
 
