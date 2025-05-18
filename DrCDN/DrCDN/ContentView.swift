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
        AdaptiveGrid {
            ForEach(viewModel.model.kpiItems, id: \.self) { item in
                KPIWrapperView(model: item)
            }
        }
        .background(Color.primaryBackground)
    }
}

#Preview {
    ContentView()
}
