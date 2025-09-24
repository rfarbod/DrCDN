//
//  KPIWrapperView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI

public struct KPIWrapperView: View {
    public var model: KPIWrapperModel
    
    public init(model: KPIWrapperModel) {
        self.model = model
    }
    
    public var body: some View {
        switch model.type {
        case .kpiBar(let kPIBarViewModel):
            KPIBarView(model: kPIBarViewModel)
            
        case .kpiCard(let kPICardModel):
            KPICardView(model: kPICardModel)
            
        case .kpiComparisson(let kPIComparisonModel):
            KPIComprassionView(model: kPIComparisonModel)
            
        case .kpiList(let kPIListModel):
            KPIListView(model: kPIListModel)
            
        case .kpiPie(let kPIPieModel):
            KPIPieChartView(model: kPIPieModel)
        }
    }
}
