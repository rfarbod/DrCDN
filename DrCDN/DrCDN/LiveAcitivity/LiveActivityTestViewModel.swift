//
//  LiveActivityTestViewModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

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
    }
    
    func loadItems() {
        guard let url = Bundle.main.url(
                forResource: "DashboardLayout",
                withExtension: "json"
        ) else {
            print("⚠️ DashboardLayout.json not found in bundle")
            return
        }

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let data = try Data(contentsOf: url)
                let wrappers = try JSONDecoder().decode(
                    [KPIWrapperCodableModel].self,
                    from: data
                )

                DispatchQueue.main.async {
                    let model = HomeModel(kpiItems: wrappers.map({ model in
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
