//
//  SegmentsModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct SegmentsModel: Identifiable, Equatable {
    public let id: UUID
    public let items: [SegmentModel]

    public init(
        id: UUID = UUID(),
        items: [SegmentModel]
    ) {
        self.id = id
        self.items = items
    }
}
