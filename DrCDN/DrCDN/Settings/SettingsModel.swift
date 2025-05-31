//
//  SettingsModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI
import Foundation

struct SettingsModel: Sendable {
    var settings: [SettingsRowModel]
    
    init(
        settings: [SettingsRowModel]
    ) {
        self.settings = settings
    }
}

extension SettingsModel {
    static let `default`: SettingsModel = .init(settings: [])
}
