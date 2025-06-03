//
//  OppositeDataView.swift
//  AppUI
//
//  Created by Farbod on 6/3/25.
//

import SwiftUI

public struct OppositeDataView: View {
    let model: OppositeDataModel
    
    public init(model: OppositeDataModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(spacing: 4) {
            Text(model.title)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack(spacing: 4) {
                Image(systemName: model.upperIcon)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                Text("\(formatted(model.upperSpeed))")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("K/s")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 4) {
                Image(systemName: model.lowerIcon)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                Text("\(formatted(model.lowerSpeed))")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("K/s")
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .fixedSize()
    }
    
    private func formatted(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.1f", value)
        } else {
            return String(format: "%.2f", value)
        }
    }
}
