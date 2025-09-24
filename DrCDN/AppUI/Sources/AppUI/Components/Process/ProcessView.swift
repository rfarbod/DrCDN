//
//  ProcessView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

struct ProcessView: View {
    private enum Constants {
        static let rowHeight: CGFloat = 34
        static let columnSpacing: CGFloat = 16
        static let userWidth: CGFloat = 72
        static let pidWidth: CGFloat = 56
        static let cpuWidth: CGFloat = 56
        static let processWidth: CGFloat = 140
    }

    let model: ProcessModel

    var body: some View {
        HStack(spacing: Constants.columnSpacing) {
            Text(model.pid)
                .frame(width: Constants.pidWidth, alignment: .leading)
                .foregroundStyle(Color.textHigh)

            Text(model.processName)
                .frame(width: Constants.processWidth, alignment: .leading)
                .foregroundStyle(Color.textHigh)

            Text(model.user)
                .frame(width: Constants.userWidth, alignment: .leading)
                .foregroundStyle(Color.textMed.opacity(0.85))

            Spacer()

            Text(model.cpuUsage)
                .frame(width: Constants.cpuWidth, alignment: .trailing)
                .foregroundStyle(Color.textHigh)
        }
        .font(.system(size: 13, weight: .regular))
        .frame(height: Constants.rowHeight)
    }
}

#Preview("ProcessView") {
    ProcessView(
        model: .init(pid: "1824", processName: "system_core.exe", user: "SYSTEM", cpuUsage: "12.8%")
    )
    .padding()
    .background(Color.black)
}
