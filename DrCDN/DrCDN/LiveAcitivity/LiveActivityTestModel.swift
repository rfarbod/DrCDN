//
//  LiveActivityModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI

struct LiveActivityTestModel: Sendable {
    var types: [LiveActivityTypeModel]
    
    init(
        types: [LiveActivityTypeModel] = Self.default.types
    ) {
        self.types = types
    }
}

extension LiveActivityTestModel {
    static let `default`: LiveActivityTestModel = .init(types: [])
}
