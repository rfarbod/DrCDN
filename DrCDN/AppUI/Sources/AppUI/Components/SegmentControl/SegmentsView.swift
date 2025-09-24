//
//  SegmentsView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct SegmentsView: View {
    private enum Constants {
        static let spacing: CGFloat = 16
        static let separatorSize: CGFloat = 4
    }

    private let model: SegmentsModel

    public init(model: SegmentsModel) {
        self.model = model
    }

    public var body: some View {
        HStack(spacing: Constants.spacing) {
            ForEach(Array(model.items.enumerated()), id: \.element.id) { index, segment in
                SegmentItemView(model: segment)

                if index < model.items.count - 1 {
                    Circle()
                        .fill(Color.textMed.opacity(0.55))
                        .frame(width: Constants.separatorSize, height: Constants.separatorSize)
                }
            }
        }
    }
}

private struct SegmentItemView: View {
    private enum Constants {
        static let fontSize: CGFloat = 10
    }

    let model: SegmentModel

    var body: some View {
        Button(action: { model.onTap(model) }) {
            Text(model.title)
                .font(.system(size: Constants.fontSize, weight: model.isSelected ? .semibold : .regular))
                .foregroundStyle(model.isSelected ? Color.primaryGreen : Color.textMed)
        }
        .buttonStyle(.plain)
        .contentShape(Rectangle())
    }
}

#Preview("SegmentsView") {
    SegmentsView(
        model: .init(
            items: [
                SegmentModel(title: "Overview", isSelected: true) { _ in },
                SegmentModel(title: "Metrics", isSelected: false) { _ in },
                SegmentModel(title: "Logs", isSelected: false) { _ in },
                SegmentModel(title: "Relation", isSelected: false) { _ in },
                SegmentModel(title: "Tickets", isSelected: false) { _ in }
            ]
        )
    )
    .background(Color.black)
}
