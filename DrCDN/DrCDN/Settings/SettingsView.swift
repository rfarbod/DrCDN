//
//  SettingsView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.primaryBackground)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ScrollView {
                    ForEach(viewModel.model.settings) { setting in
                        NavigationLink {
                            LiveActivityTestView(viewModel: .init(model: .default))
                        } label: {
                            SettingsRowView(model: setting)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    .onAppear {
                        viewModel.getSettingsItems()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
