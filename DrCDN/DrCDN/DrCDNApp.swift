//
//  DrCDNApp.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import AppUI
import SwiftUI

@main
struct DrCDNApp: App {
    @State var selectedTab: Int = 0
    
    var body: some Scene {
        WindowGroup {
            RoundedTabBarView(selectedTab: selectedTab)
        }
    }
}
