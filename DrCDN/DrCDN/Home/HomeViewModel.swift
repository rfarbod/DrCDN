//
//  ContentViewModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/11/25.
//

#if os(iOS)
import ActivityKit
#endif
import Foundation
import Combine
import AppUI
import AppDomain

final class HomeViewModel: ObservableObject {
    @Published var model: HomeModel = .default
    private var cancellables = Set<AnyCancellable>()

    public init() {
        loadItems()
    }
    
    func loadItems() {
        guard let url = Bundle.main.url(
            forResource: "DashboardLayout",
            withExtension: "json"
        ) else {
            print("⚠️ DashboardLayout.json not found in bundle")
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self else { return }
            
            do {
                let data = try Data(contentsOf: url)
                let wrappers: [KPIWrapperResponseModel] = try JSONDecoder().decode(
                    [KPIWrapperResponseModel].self,
                    from: data
                )
                
                let mappedWrappers = self.mapToKPIWrapperModel(wrappers)
                
                DispatchQueue.main.async {
                    self.model = HomeModel(kpiItems: mappedWrappers.map({ model in
                        return .init(type: model.type)
                    }))
                }
            } catch {
                print("❌ Failed to load/parse DashboardLayout.json:", error)
            }
        }
    }
    
    private func mapToKPIWrapperModel(_ model: [KPIWrapperResponseModel]) -> [KPIWrapperModel] {
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
    
    #if os(iOS)
    func startLiveActivity() {
//        let chartData = model.kpiItems.
//        
//        let attributes = MonitorLiveAttributes(name: "Something")
//        let initialState = MonitorLiveAttributes.ContentState(chartModel: model.)
//
//        do {
//            let activity = try Activity.request(
//                attributes: attributes,
//                content: .init(state: initialState, staleDate: Date.distantFuture),
//                pushType: nil
//            )
//            
//            print("Live Activity started: \(activity.id)")
//        } catch {
//            print("Error starting Live Activity: \(error)")
//        }
    }
    #endif
}
