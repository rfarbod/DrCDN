//
//  ContentModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import AppUI

struct ContentModel {
    var kpiItems: [KPIWrapperModel]
    
    init(
        kpiItems: [KPIWrapperModel] = Self.default.kpiItems
    ) {
        self.kpiItems = kpiItems
    }
}

extension ContentModel {
    static let `default`: ContentModel = .init(kpiItems: [])
}
