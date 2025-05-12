//
//  KPIView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI
import Charts

public struct KPIPieChartView: View {
    public let model: KPIPieModel

    public init(model: KPIPieModel) {
        self.model = model
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(model.title)
                .font(.headline)
                .foregroundColor(.textHigh)

            Text(model.subtitle)
                .font(.subheadline)
                .foregroundColor(.textMed)

            ZStack {
                if let pie = model.chartData {
                    Chart {
                        ForEach(pie.slices) { slice in
                            SectorMark(
                                angle: .value("Value", slice.value)
                            )
                            .foregroundStyle(Color("\(slice.color)", bundle: .module))
                        }
                    }
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    .frame(width: 120, height: 120)

                    Circle()
                        .fill(Color.cardBG)
                        .frame(width: 72, height: 72)

                    let total = Int(pie.slices.reduce(0) { $0 + $1.value })
                    Text("\(total)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.textHigh)
                }
            }

            if let pie = model.chartData {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(pie.slices.enumerated()), id: \.element.id) { _, slice in
                        HStack(spacing: 8) {
                            Circle()
                                .fill(Color(slice.color, bundle: .module))
                                .frame(width: 8, height: 8)
                            Text("\(Int(slice.value))%")
                                .font(.body)
                                .foregroundColor(.textHigh)
                        }
                    }
                }
            }
        }
        .padding(16)
        .background(Color.cardBG)
        .cornerRadius(16)
    }
}
