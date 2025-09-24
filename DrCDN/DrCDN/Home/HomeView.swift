//
//  ContentView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import AppUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = .init()
    
    var body: some View {
        VStack {
            AdaptiveGrid {
                ForEach(viewModel.model.kpiItems, id: \.self) { item in
                    KPIWrapperView(model: item)
                }
            }
            .onAppear(perform: {
            })
            .background(Color.primaryBackground)
        }
    }
}

#Preview {
    HomeView()
}
