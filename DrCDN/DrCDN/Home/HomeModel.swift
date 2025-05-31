//
//  ContentModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import AppUI

struct HomeModel {
    var kpiItems: [KPIWrapperModel]
    
    init(
        kpiItems: [KPIWrapperModel] = Self.default.kpiItems
    ) {
        self.kpiItems = kpiItems
    }
}

extension HomeModel {
    static let `default`: HomeModel = .init(kpiItems: [])
}
