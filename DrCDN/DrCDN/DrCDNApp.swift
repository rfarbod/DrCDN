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
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(viewModel: .init(hasCompletedOnboarding: false))
        }
    }
}
