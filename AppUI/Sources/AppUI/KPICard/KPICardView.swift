//
//  TrafficQuotaView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI

public struct KPICardView: View {
    public let model: KPICardModel

    public init(model: KPICardModel) {
        self.model = model
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(model.title)
                .font(.headline)
                .foregroundColor(.textHigh)

            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text(model.leftValue)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.textHigh)
                        Text(model.leftUnit)
                            .font(.subheadline)
                            .foregroundColor(.textMed)
                    }
                }

                Spacer()

                if let data = model.chartData, !data.yValues.isEmpty {
                    SparklineChartView(data: data)
                        .frame(width: 50, height: 24)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    HStack(alignment: .firstTextBaseline, spacing: 2) {
                        Text(model.rightValue)
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.primaryAccent)
                        Text(model.rightUnit)
                            .font(.subheadline)
                            .foregroundColor(.textMed)
                    }
                }
            }
        }
        .padding(16)
        .background(Color.cardBG)
        .cornerRadius(16)
    }
}
