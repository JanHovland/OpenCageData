//
//  UserSetting.swift
//  OpenCageData
//
//  Created by Jan Hovland on 09/09/2022.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    
    @Published var keyOpenCage: String {
        didSet {
            UserDefaults.standard.set(keyOpenCage, forKey: "KeyOpenCage")
        }
    }
    
    @Published var urlOpenCage: String {
        didSet {
            UserDefaults.standard.set(urlOpenCage, forKey: "UrlOpenCage")
        }
    }
    
    init() {
        self.keyOpenCage = UserDefaults.standard.object(forKey: "KeyOpenCage") as? String ?? ""
        self.urlOpenCage = UserDefaults.standard.object(forKey: "UrlOpenCage") as? String ?? ""
    }
}
