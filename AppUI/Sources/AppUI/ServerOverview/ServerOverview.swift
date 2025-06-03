//
//  ServerOverview.swift
//  AppUI
//
//  Created by Farbod on 6/3/25.
//

import SwiftUI

public struct ServerOverview: View {
    let model: ServerOverviewModel
    
    public init(model: ServerOverviewModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Test")
                        .font(.headline)
                        .padding(.top)
                    
                    Spacer()
                    
                    Circle()
                        .frame(
                            width: 10,
                            height: 10
                        )
                        .foregroundStyle(model.state.color)
                        .padding(.top)
                }
                
                HStack() {
                    Image(systemName: "cpu")
                    Text("\(model.coreCount) cores")
                        .font(.footnote)
                    
                    Spacer()
                    
                    Image(systemName: "memorychip")
                    Text("\(Int(model.ram)) G")
                        .font(.footnote)
                    
                    Spacer()
                    
                    Image(systemName: "opticaldiscdrive")
                    Text("\(model.storage) T")
                        .font(.footnote)
                    
                    Spacer()
                    
                    Image(systemName: "power")
                    Text("\(model.uptime) days")
                        .font(.footnote)
                }
                
                Divider()
                
                HStack {
                    CircularProgressView(title: "CPU", progress: 0)
                        .frame(width: 90, height: 90)
                        .padding(.bottom)
                    
                    CircularProgressView(title: "RAM", progress: 0.6)
                        .frame(width: 90, height: 90)
                        .padding(.bottom)
                    
                    OppositeDataView(model: .init(
                        title: "Network",
                        upperIcon: "arrow.up.circle",
                        lowerIcon: "arrow.down.circle",
                        upperSpeed: 18.0,
                        lowerSpeed: 1.33
                    ))
                                        
                    OppositeDataView(model: .init(
                        title: "Disk",
                        upperIcon: "arrow.up.circle",
                        lowerIcon: "arrow.down.circle",
                        upperSpeed: 18.0,
                        lowerSpeed: 1.33
                    ))
                    .padding(.trailing)
                }
            }
        }
        .background(Color.cardBG)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ServerOverview_Previews: PreviewProvider {
    static var previews: some View {
        ServerOverview(model: .init(
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
        ))
    }
}
