//
//  ContentView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI
import AppUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = .init()
    
    var body: some View {
        VStack {
            AdaptiveGrid {
                HStack() {
                    ServerStatusView(model: .init(
                        title: "Total Servers",
                        dotColor: Color.cyan,
                        number: 1
                    ))
                    .frame(width: 120)
                    
                    ServerStatusView(model: .init(
                        title: "Online Servers",
                        dotColor: Color.green,
                        number: 1
                    ))
                    .frame(width: 120)
                    
                    ServerStatusView(model: .init(
                        title: "Offline Servers",
                        dotColor: Color.red,
                        number: 1
                    ))
                    .frame(width: 120)
                }
                
                ServerOverview(
                    model: .init(
                        title: "Test",
                        state: .running,
                        coreCount: 128,
                        ram: 251,
                        storage: 1.98,
                        uptime: 90,
                        cpuLoad: 0,
                        memoryLoad: 6,
                        networkDownload: 18.0,
                        networkUpload: 1.33,
                        diskRead: 0,
                        diskWrite: 12.0
                    )
                )
                .padding()
                
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
