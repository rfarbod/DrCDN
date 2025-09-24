//
//  KPIPieChart.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/18/25.
//

import SwiftUI
import Charts

public struct KPIPieChart: View {
    public let model: KPIPieChartModel
    
    public init(model: KPIPieChartModel) {
        self.model = model
    }
    
    public var body: some View {
        Chart {
            ForEach(model.slices) { slice in
                SectorMark(
                    angle: .value("Value", slice.value),
                    innerRadius:  .fixed(slice.innerRadius ?? 0),
                    angularInset: slice.angularInset
                )
                .cornerRadius(slice.cornerRadius ?? 0)
                .foregroundStyle(
                    Color("\(slice.color)", bundle: .module)
                        .opacity(slice.opacity ?? 1)
                )
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .frame(
            idealWidth: model.frame?.width ?? .infinity,
            maxWidth: .infinity,
            idealHeight:  model.frame?.height ?? .infinity,
            maxHeight: model.frame?.height ?? .infinity
        )
    }
}
