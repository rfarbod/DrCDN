//
//  LiveActivityTestViewModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppDomain
import AppUI
import Combine
import Foundation

#if os(iOS)
import ActivityKit
#endif

final class LiveActivityTestViewModel: ObservableObject {
    @Published var model: LiveActivityTestModel
    
    init(model: LiveActivityTestModel) {
        self.model = model
    }
    
    func getLiveActivityTypes() {
#if os(iOS)
        loadItems()
        
        model.types = [
            .init(
                id: UUID().uuidString,
                title: "Spark line Chart",
                description: "Start a live activity with a spark line chart inside of it",
                image: "chart.line.flattrend.xyaxis",
                onTap: { [weak self] in
                    guard let self = self else { return }
                    
                    if let kpiCard = self.model.kpiCard {
                        self.startLiveActivity(barModel: nil, pieModel: nil, cardModel: kpiCard)
                    }
                }
            ),
            .init(
                id: UUID().uuidString,
                title: "Bar Chart",
                description: "Start a live activity with a bar chart inside of it",
                image: "chart.bar",
                onTap: { [weak self] in
                    guard let self = self else { return }
                    
                    if let kpiBar = self.model.kpiBar {
                        self.startLiveActivity(barModel: kpiBar, pieModel: nil, cardModel: nil)
                    }
                }
            ),
            .init(
                id: UUID().uuidString,
                title: "Stop",
                description: "Terminate all live activities",
                image: "stop",
                onTap: { [weak self] in
                    guard let self else { return }
                    self.endAllLiveActivities()
                }
            )
        ]
#endif
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
                    let model = HomeModel(kpiItems: mappedWrappers.map({ model in
                        return .init(type: model.type)
                    }))
                    
                    model.kpiItems.forEach { model in
                        switch model.type {
                        case .kpiBar(let kPIBarViewModel):
                            self.model.kpiBar = kPIBarViewModel
                            
                        case .kpiPie(let kPIPieModel):
                            self.model.kpiPie = kPIPieModel
                            
                        case .kpiCard(let kpiCardModel):
                            self.model.kpiCard = kpiCardModel
                            
                        default:
                            break
                        }
                    }
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
    func startLiveActivity(
        barModel: KPIBarViewModel?,
        pieModel: KPIPieModel?,
        cardModel: KPICardModel?
    ) {
        let attributes = MonitorLiveAttributes(name: "Something")
        let initialState = MonitorLiveAttributes.ContentState(
            barModel: barModel,
            pieModel: pieModel,
            cardModel: cardModel
        )
        
        do {
            let activity = try Activity.request(
                attributes: attributes,
                content: .init(state: initialState, staleDate: Date.distantFuture),
                pushType: nil
            )
            
            print("Live Activity started: \(activity.id)")
        } catch {
            print("Error starting Live Activity: \(error)")
        }
    }
#endif
    
#if os(iOS)
    func endAllLiveActivities() {
        for activity in Activity<MonitorLiveAttributes>.activities {
            Task {
                await activity.end(nil, dismissalPolicy: .immediate)
            }
        }
    }
#endif
}
