//
//  ProcessesModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct ProcessesModel: Equatable {
    public let items: [ProcessModel]

    public init(items: [ProcessModel]) {
        self.items = items
    }
}
