//
//  ContentView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI
import AppUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        VStack {
            AdaptiveGrid {
                ForEach(viewModel.model.kpiItems, id: \.self) { item in
                    KPIWrapperView(model: item)
                }
            }
            .onAppear(perform: {
                #if os(iOS)
                viewModel.startLiveActivity()
                #endif
            })
            .background(Color.primaryBackground)
        }
    }
}

#Preview {
    ContentView()
}
