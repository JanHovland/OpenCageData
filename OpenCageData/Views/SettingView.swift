//
//  SettinView.swift
//  OpenCageData
//
//  Created by Jan Hovland on 16/09/2022.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Key for OpenCage")) {
                    TextField("Key for OpenCage", text: $userSettings.keyOpenCage)
                        .foregroundColor(.blue)
                        .font(.footnote)
                }
                Section(header: Text("Url for OpenCage")) {
                    TextField("Url for OpenCage", text: $userSettings.urlOpenCage)
                        .foregroundColor(.blue)
                        .font(.footnote)
                }
            }
        }
        .navigationTitle("Settings")
    }
}
