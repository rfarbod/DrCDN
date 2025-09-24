//
//  MetricDisturbutationView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct MetricDisturbutationView: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 18
        static let tilePadding: CGFloat = 16
        static let donutSize: CGFloat = 80
        static let donutLineWidth: CGFloat = 14
        static let sectionSpacing: CGFloat = 22
        static let legendSpacing: CGFloat = 10
    }
    
    private let model: MetricDisturbutionModel
    
    public init(model: MetricDisturbutionModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.sectionSpacing) {
            Text(model.title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(Color.textHigh)
            
            donutChart
                .frame(maxWidth: .infinity)
            
            legend
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(Constants.tilePadding)
        .frame(width: 160)
        .background(Color.textFieldBackground)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .stroke(Color.textMed.opacity(0.35), lineWidth: 1)
        )
    }
    
    private var donutChart: some View {
        ZStack {
            Circle()
                .stroke(Color.textMed.opacity(0.12), lineWidth: Constants.donutLineWidth)
            
            if model.total > 0 {
                ForEach(Array(model.breakdown.enumerated()), id: \.offset) { index, breakdown in
                    DonutSlice(
                        startFraction: fraction(at: index),
                        endFraction: fraction(at: index + 1),
                        color: breakdown.id.color
                    )
                }
            }
            
            VStack(spacing: 2) {
                Text("\(model.total)")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color.textHigh)
                Text("Active")
                    .font(.system(size: 11))
                    .foregroundStyle(Color.textMed)
            }
        }
        .frame(width: Constants.donutSize, height: Constants.donutSize)
    }
    
    private var legend: some View {
        VStack(alignment: .leading, spacing: Constants.legendSpacing) {
            ForEach(model.breakdown, id: \.id) { item in
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(item.id.color)
                        .frame(width: 4, height: 18)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 6) {
                            Text(item.id.title)
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(Color.textHigh)
                            Image(systemName: "arrow.up.right")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(Color.textMed.opacity(0.75))
                        }
                        Text("\(item.value)")
                            .font(.system(size: 13))
                            .foregroundStyle(Color.textMed)
                    }
                }
            }
        }
    }
    
    private func fraction(at index: Int) -> CGFloat {
        let values = model.breakdown.map { Double($0.value) }
        let total = values.reduce(0, +)
        guard total > 0 else { return 0 }
        let sum = values.prefix(index).reduce(0, +)
        return CGFloat(sum / total)
    }
    
    private struct DonutSlice: View {
        let startFraction: CGFloat
        let endFraction: CGFloat
        let color: Color
        
        var body: some View {
            Circle()
                .trim(from: startFraction, to: endFraction)
                .stroke(color, style: StrokeStyle(lineWidth: MetricDisturbutationView.Constants.donutLineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

#Preview("MetricDisturbutationView") {
    MetricDisturbutationView(
        model: .init(
            title: "Active Alert",
            breakdown: [
                .init(kind: .critical, value: 4),
                .init(kind: .warning, value: 19)
            ]
        )
    )
    .padding()
    .background(Color.black)
}
