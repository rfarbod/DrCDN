//
//  SparkLineChartView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI
import Charts

public struct SparklineChartView: View {
    let data: ChartModel
    
    public init(data: ChartModel) {
        self.data = data
    }

    public var body: some View {
        Chart {
            ForEach(Array(zip(data.xValues, data.yValues)), id: \.0) { x, y in
                AreaMark(
                    x: .value("X", x),
                    y: .value("Y", y)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.blue.opacity(0.3), location: 0),
                            .init(color: Color.blue.opacity(0.0), location: 1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

                LineMark(
                    x: .value("X", x),
                    y: .value("Y", y)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(Color.blue)
                .lineStyle(StrokeStyle(lineWidth: 2))
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartLegend(.hidden)
    }
}
