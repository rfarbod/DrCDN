//
//  ProjectView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//
import SwiftUI

public struct ProjectView: View {
    private enum Constants {
        static let horizontalPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 8
        static let spacing: CGFloat = 12
        static let cornerRadius: CGFloat = 16
        static let fontSize: CGFloat = 14
        static let iconSize: CGFloat = 14
    }

    private let model: ProjectModel

    public init(model: ProjectModel) {
        self.model = model
    }

    public var body: some View {
        HStack(spacing: Constants.spacing) {
            Text(model.title)
                .font(.system(size: Constants.fontSize, weight: .semibold))
                .foregroundStyle(Color.black.opacity(0.88))

            Spacer(minLength: 0)

            Image(systemName: "ellipsis.vertical")
                .font(.system(size: Constants.iconSize, weight: .semibold))
                .foregroundStyle(Color.black.opacity(0.7))
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.vertical, Constants.verticalPadding)
        .background(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .fill(Color.primaryGreen.opacity(0.4))
        )
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .stroke(Color.primaryGreen.opacity(0.65), lineWidth: 1)
        )
    }
}

#Preview("ProjectView") {
    ProjectView(model: .init(title: "Project Name"))
        .padding()
        .background(Color.black)
}
