//
//  ProcessesView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct ProcessesView: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 18
        static let tilePadding: CGFloat = 16
        static let headerHeight: CGFloat = 44
        static let rowSpacing: CGFloat = 4
    }

    private let model: ProcessesModel

    public init(model: ProcessesModel) {
        self.model = model
    }

    public var body: some View {
        VStack(spacing: 0) {
            header
                .padding(.horizontal, Constants.tilePadding)
                .frame(height: Constants.headerHeight)

            Divider()
                .background(Color.textMed.opacity(0.35))

            VStack(spacing: Constants.rowSpacing) {
                ForEach(Array(model.items.enumerated()), id: \.element.id) { index, item in
                    ProcessView(model: item)
                    if index != model.items.count - 1 {
                        Divider()
                            .background(Color.textMed.opacity(0.15))
                    }
                }
            }
            .padding(.horizontal, Constants.tilePadding)
            .padding(.vertical, Constants.tilePadding)
        }
        .background(Color.textFieldBackground)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .stroke(Color.textMed.opacity(0.35), lineWidth: 1)
        )
    }

    private var header: some View {
        HStack(spacing: 16) {
            Text("PID")
                .frame(width: 56, alignment: .leading)

            Text("Process")
                .frame(width: 140, alignment: .leading)

            Text("User")
                .frame(width: 72, alignment: .leading)

            Spacer()

            Text("Cpu")
                .frame(width: 56, alignment: .trailing)
        }
        .font(.system(size: 12, weight: .medium))
        .foregroundStyle(Color.textMed)
    }
}

#Preview("ProcessesView") {
    ProcessesView(
        model: .init(items: [
            .init(pid: "1824", processName: "system_core.exe", user: "SYSTEM", cpuUsage: "12.8%"),
            .init(pid: "1824", processName: "system_core.exe", user: "SYSTEM", cpuUsage: "12.8%"),
            .init(pid: "1824", processName: "system_core.exe", user: "SYSTEM", cpuUsage: "12.8%"),
            .init(pid: "1824", processName: "system_core.exe", user: "SYSTEM", cpuUsage: "12.8%"),
            .init(pid: "1824", processName: "system_core.exe", user: "SYSTEM", cpuUsage: "12.8%")
        ])
    )
    .padding()
    .background(Color.black)
}
