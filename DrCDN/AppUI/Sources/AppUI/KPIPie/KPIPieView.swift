//
//  KPIView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI
import Charts

public struct KPIPieChartView: View {
    private enum Constants {
        static let mainChartFrameSize: CGSize = .init(width: 250, height: 250)
    }
    
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
                    KPIPieChart(model: .init(
                        slices: pie.slices,
                        frame: .init(
                            width: Constants.mainChartFrameSize.width,
                            height: Constants.mainChartFrameSize.height
                        )
                    ))
                    .zIndex(2)
                    
                    Circle()
                        .fill(Color.cardBG)
                        .frame(width: 72, height: 72)
                        .zIndex(1)
                    
                    let total = Int(pie.slices.reduce(0) { $0 + $1.value })
                    Text("\(total)")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.textHigh)
                }
                
                if let pie = model.chartData {
                    KPIPieChart(model: .init(
                        slices: pie.slices,
                        frame: .init(
                            width: Constants.mainChartFrameSize.width / (model.chartData?.opacityRatio ?? 1),
                            height: Constants.mainChartFrameSize.height / (model.chartData?.opacityRatio ?? 1)
                        )
                    ))
                    .zIndex(1)
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
        .frame(maxWidth: .infinity)
        .cornerRadius(16)
    }
}
