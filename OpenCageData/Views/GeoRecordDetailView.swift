//
//  DetailGeoRecordDetailView.swift
//  OpenCageData
//
//  Created by Jan Hovland on 25/09/2022.
//

import SwiftUI

struct GeoRecordDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var geo: GeoRecord 
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("SearchString = \(geo.searchString)")
            Text(geo.flag)
                .font(.system(size: 100))
            Text(geo.formatted)
            Text("Longitude = " + (geo.longitude?.description ?? ""))
                .monospacedDigit()
            Text("Latitude = " + (geo.latitude?.description ?? ""))
                .monospacedDigit()
            Spacer()
        }
        .navigationTitle("Detail view")
#if os(iOS)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    /// Lukker dette view og returnerer til forrige view
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                }
            }
        })
#elseif os(macOS)
        
#endif
    }
}


