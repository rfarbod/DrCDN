//
//  SegmentModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct SegmentModel: Identifiable, Equatable, Hashable {
    public let id: UUID
    public let title: String
    public let isSelected: Bool
    public let onTap: (SegmentModel) -> Void

    public init(
        id: UUID = UUID(),
        title: String,
        isSelected: Bool,
        onTap: @escaping (SegmentModel) -> Void
    ) {
        self.id = id
        self.title = title
        self.isSelected = isSelected
        self.onTap = onTap
    }
}

extension SegmentModel {
    public static func == (lhs: SegmentModel, rhs: SegmentModel) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        // Hash only the stable identity; ignore the non-hashable `onTap` closure
        hasher.combine(id)
    }
}
