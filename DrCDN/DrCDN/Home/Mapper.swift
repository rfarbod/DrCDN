//
//  Mapper.swift
//  DrCDN
//
//  Created by Farbod on 6/3/25.
//

import AppUI
import AppDomain

struct Mapper {
    static func mapToKPIWrapperModel(_ model: [KPIWrapperResponseModel]) -> [KPIWrapperModel] {
        var mappedModel: [KPIWrapperModel] = []
        model.forEach { response in
            switch response.type {
            case .kpiBar(let barResponse):
                let wrapper = KPIWrapperModel(
                    type: .kpiBar(
                        KPIBarViewModel(
                            title: barResponse.title,
                            subtitle: barResponse.subtitle,
                            chartData: ChartModel.init(
                                xValues: barResponse.chartData?.xValues ?? [],
                                yValues: barResponse.chartData?.yValues ?? []
                            )
                        )
                    )
                )
                mappedModel.append(wrapper)
                
            case .kpiCard(let cardResponse):
                let wrapper = KPIWrapperModel(
                    type: .kpiCard(
                        KPICardModel(
                            title: cardResponse.title,
                            leftValue: cardResponse.leftValue,
                            leftUnit: cardResponse.leftUnit,
                            rightValue: cardResponse.rightValue,
                            rightUnit: cardResponse.rightUnit,
                            chartData: ChartModel.init(
                                xValues: cardResponse.chartData?.xValues ?? [],
                                yValues: cardResponse.chartData?.yValues ?? []
                            )
                        )
                    )
                )
                mappedModel.append(wrapper)
                
            case .kpiComparisson(let comparisonResponse):
                let wrapper = KPIWrapperModel(
                    type: .kpiComparisson(
                        KPIComparisonModel(
                            title: comparisonResponse.title,
                            subtitle: comparisonResponse.subtitle,
                            series: comparisonResponse.series.map { chartArray in
                                chartArray.map { innerResponse in
                                    ChartModel.init(
                                        xValues: innerResponse.xValues,
                                        yValues: innerResponse.yValues
                                    )
                                }
                            }
                        )
                    )
                )
                mappedModel.append(wrapper)
                
            case .kpiList(let listResponse):
                let wrapper = KPIWrapperModel(
                    type: .kpiList(
                        KPIListModel(
                            listTitle: listResponse.listTitle,
                            items: listResponse.items.map { item in
                                ListItem.init(title: item.title, value: item.value)
                            }
                        )
                    )
                )
                mappedModel.append(wrapper)
                
            case .kpiPie(let pieResponse):
                let wrapper = KPIWrapperModel(
                    type: .kpiPie(
                        KPIPieModel(
                            title: pieResponse.title,
                            subtitle: pieResponse.subtitle,
                            chartData: .init(
                                slices: pieResponse.chartData?.slices.map({ response in
                                    SliceModel.init(
                                        label: response.label,
                                        value: response.value,
                                        color: response.color,
                                        angularInset: response.angularInset,
                                        opacity: response.opacity,
                                        cornerRadius: response.cornerRadius,
                                        innerRadius: response.innerRadius
                                    )
                                }) ?? [],
                                opacityRation: pieResponse.chartData?.opacityRatio ?? 0
                            )
                        )
                    )
                )
                mappedModel.append(wrapper)
            }
        }
        
        return mappedModel
    }
}
