//
//  KPIComprassionView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI
import Charts

public struct KPIComprassionView: View {
    public var model: KPIComparisonModel
    private let colors: [Color] = [.primaryAccent, .secondaryAccent, .tertiaryAccent]
    
    public init(model: KPIComparisonModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(model.title)
                .font(.headline)
                .foregroundColor(.textHigh)
            if let subtitle = model.subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.textMed)
            }
            
            if !model.series.isEmpty {
                Chart {
                    ForEach(model.series.indices, id: \.self) { groupIndex in
                        let group = model.series[groupIndex]
                        let color = colors[groupIndex % colors.count]
                        
                        ForEach(group.indices, id: \.self) { seriesIndex in
                            let data = group[seriesIndex]
                            
                            ForEach(Array(data.xValues.enumerated()), id: \.offset) { offset, x in
                                let y = data.yValues[offset]
                                
                                LineMark(
                                    x: .value("X", x),
                                    y: .value("Y", y)
                                )
                                .interpolationMethod(.catmullRom)
                                .foregroundStyle(color)
                                .symbol(by: .value("Series", "Series \(groupIndex)"))
                            }
                        }
                    }
                }
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .frame(height: 120)
            }
        }
        .padding(16)
        .background(Color.cardBG)
        .cornerRadius(16)
    }
}
