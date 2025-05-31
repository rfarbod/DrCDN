//
//  SettingsView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI
import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        ForEach(viewModel.model.settings) { setting in
            SettingsRowView(model: setting)
        }
    }
}
