//
//  GeoRecordDetailView.swift
//  OpenCageData
//
//  Created by Jan Hovland on 17/09/2022.
//

import SwiftUI

struct GeoRecordView: View {
    
    var geoRecords: [GeoRecord]
    var lonLat : Bool
    
    var body: some View {
        if !geoRecords.isEmpty {
            NavigationStack {
                List {
                    ForEach(geoRecords) { geoRecord in
                        NavigationLink(destination:  GeoRecordDetailView(geo: geoRecord)) {
                            HStack {
                                Text(geoRecord.flag)
                                    .textSelection(.enabled)
                                Text(geoRecord.type)
                                    .textSelection(.enabled)
                                    .foregroundColor(.green)
                                Text(geoRecord.formatted)
                                    .textSelection(.enabled)
                                if (lonLat) {
                                    if geoRecord.longitude != nil {
                                        Text("\(geoRecord.longitude!)")
                                            .foregroundColor(.blue)
                                    }
                                    if geoRecord.latitude != nil {
                                        Text("\(geoRecord.latitude!)")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                            
                        }
                        .font(.footnote)
                    }
                    
                }
            }
        }
        else {
            Text("Not able to find geo Data!")
                .foregroundColor(.red)
                .padding()
        }
    }
}

