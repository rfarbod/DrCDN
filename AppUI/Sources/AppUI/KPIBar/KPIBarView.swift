//
//  KPIBarView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI
import Charts

public struct KPIBarView: View {
    public let model: KPIBarViewModel

    public init(model: KPIBarViewModel) {
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

            if let data = model.chartData {
                Chart {
                    ForEach(Array(zip(data.xValues, data.yValues)), id: \.0) { x, y in
                        BarMark(
                            x: .value("X", x),
                            y: .value("Y", y)
                        )
                        .cornerRadius(4)
                        .foregroundStyle(Color.primaryAccent)
                    }
                }
                .chartYAxis(.hidden)
                .frame(height: 120)
            }
        }
        .padding(16)
        .background(Color.cardBG)
        .cornerRadius(16)
    }
}
