//
//  KPIViewType.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

public enum KPIViewType: Hashable {
    case kpiBar(KPIBarViewModel)
    case kpiCard(KPICardModel)
    case kpiComparisson(KPIComparisonModel)
    case kpiList(KPIListModel)
    case kpiPie(KPIPieModel)
}
