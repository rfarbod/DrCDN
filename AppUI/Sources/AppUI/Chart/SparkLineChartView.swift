//
//  SparkLineChartView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI
import Charts

struct SparklineChartView: View {
    let data: ChartModel

    var body: some View {
        Chart {
            ForEach(Array(zip(data.xValues, data.yValues)), id: \ .0) { x, y in
                LineMark(
                    x: .value("X", x),
                    y: .value("Y", y)
                )
                .interpolationMethod(.catmullRom)
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartLegend(.hidden)
    }
}
