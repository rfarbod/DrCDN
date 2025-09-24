//
//  DeviceNodesView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct DeviceNodesView: View {
    private enum Constants {
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 12
        static let verticalSpacing: CGFloat = 12
        static let nodeSpacing: CGFloat = 8
        static let cornerRadius: CGFloat = 16
        static let nameFontSize: CGFloat = 15
        static let countFontSize: CGFloat = 13
    }

    public let model: DeviceNodesModel

    public init(model: DeviceNodesModel) {
        self.model = model
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            header

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.nodeSpacing) {
                    ForEach(model.nodes.indices, id: \.self) { index in
                        NodeView(model: model.nodes[index])
                            .accessibilityLabel(Text("Node \(index + 1)"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .accessibilityIdentifier("device_nodes_scroll")
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.vertical, Constants.verticalPadding)
        .background(Color.textFieldBackground)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text(model.deviceName))
        .accessibilityValue(Text(nodesCountText))
    }

    private var header: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(model.deviceName)
                .font(.system(size: Constants.nameFontSize, weight: .semibold))
                .foregroundStyle(Color.textHigh)

            Spacer()

            Text(nodesCountText)
                .font(.system(size: Constants.countFontSize, weight: .medium))
                .foregroundStyle(Color.textMed)
        }
    }

    private var nodesCountText: String {
        let count = model.nodes.count
        return "\(count) Node\(count == 1 ? "" : "s")"
    }
}

#Preview("DeviceNodesView") {
    DeviceNodesView(
        model: .init(
            deviceName: "Linux",
            nodes: [
                .init(innerColor: AppUIAssets.surface, outerColor: AppUIAssets.primaryAccent),
                .init(innerColor: AppUIAssets.textMed, outerColor: AppUIAssets.textHigh),
                .init(innerColor: AppUIAssets.cardBG, outerColor: AppUIAssets.textFieldBorder),
                .init(innerColor: AppUIAssets.textFieldPlaceholder, outerColor: AppUIAssets.primaryGreen),
                .init(innerColor: AppUIAssets.textFieldPlaceholder, outerColor: AppUIAssets.secondaryAccent),
                .init(innerColor: AppUIAssets.surface, outerColor: AppUIAssets.tertiaryAccent)
            ]
        )
    )
    .padding()
    .frame(width: 320)
    .background(Color.primaryBackground)
}
