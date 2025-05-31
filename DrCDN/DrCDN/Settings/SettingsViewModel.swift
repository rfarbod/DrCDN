//
//  SettingsViewModle.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import Foundation
import Combine

final class SettingsViewModel: ObservableObject {
    @Published var model: SettingsModel = .default
    
    init(model: SettingsModel) {
        self.model = model
    }
    
    func getSettingsItems() {
        model.settings = [
            .init(
                id: UUID().uuidString,
                image: "clock",
                title: "Live Activity"
            ),
            .init(
                id: UUID().uuidString,
                image: "sun.min",
                title: "Theme"
            )
        ]
    }
}
