//
//  OnboardingView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import AppUI
import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        ZStack {
            Image(asset: DrCDNAssets.primaryBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Image(asset: DrCDNAssets.logo)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: 130, height: 30)
                    .padding(32)
                
                if viewModel.model.items.isEmpty {
                    ProgressView()
                } else {
                    TabView(selection: $viewModel.selection) {
                        ForEach(Array(viewModel.model.items.enumerated()), id: \.0) { index, step in
                            step
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    .padding(.horizontal, 24)
                    .padding(.bottom, 64)
                }
            }
        }
    }
}

#Preview("OnboardingView") {
    OnboardingView(viewModel: OnboardingViewModel(onComplete: {}))
}
