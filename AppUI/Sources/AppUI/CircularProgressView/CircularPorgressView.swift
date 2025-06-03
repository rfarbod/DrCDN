//
//  CircularPorgressView.swift
//  AppUI
//
//  Created by Farbod on 6/3/25.
//

import SwiftUI

public struct CircularProgressView: View {
    let title: String
    var progress: Double
    let foregroundColor: Color
    let backgroundColor: Color
    let lineWidth: CGFloat
    let percentageFont: Font
    
    public init(
        title: String,
        progress: Double,
        foregroundColor: Color = .green,
        backgroundColor: Color = Color(white: 0.2),
        lineWidth: CGFloat = 5,
        percentageFont: Font = .system(size: 16, weight: .bold)
    ) {
        self.title = title
        self.progress = progress
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.lineWidth = lineWidth
        self.percentageFont = percentageFont
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.white)
            
            ZStack {
                Circle()
                    .stroke(
                        backgroundColor,
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    )
                
                Circle()
                    .trim(from: 0, to: min(max(progress, 0), 1))
                    .stroke(
                        foregroundColor,
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 0.3), value: progress)
                
                Text("\(Int(progress * 100))%")
                    .font(percentageFont)
                    .foregroundColor(.white)
            }
        }
    }
}
