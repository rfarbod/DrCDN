//
//  LiveActivityModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI

struct LiveActivityTestModel: Sendable {
    var types: [LiveActivityTypeModel]
    var kpiBar: KPIBarViewModel?
    var kpiPie: KPIPieModel?
    var kpiCard: KPICardModel?
    
    init(
        types: [LiveActivityTypeModel] = Self.default.types,
        kpiBar: KPIBarViewModel? = Self.default.kpiBar,
        kpiPie: KPIPieModel? = Self.default.kpiPie,
        kpiCard: KPICardModel? = Self.default.kpiCard
    ) {
        self.types = types
        self.kpiBar = kpiBar
        self.kpiPie = kpiPie
        self.kpiCard = kpiCard
    }
}

extension LiveActivityTestModel {
    static let `default`: LiveActivityTestModel = .init(
        types: [],
        kpiBar: .init(),
        kpiPie: .default,
        kpiCard: nil,
    )
}
