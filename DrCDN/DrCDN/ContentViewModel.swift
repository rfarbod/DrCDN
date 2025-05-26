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

final class ContentViewModel: ObservableObject {
    @Published var model: ContentModel = .default
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

        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let data = try Data(contentsOf: url)
                let wrappers = try JSONDecoder().decode(
                    [KPIWrapperCodableModel].self,
                    from: data
                )

                DispatchQueue.main.async {
                    self.model = ContentModel(kpiItems: wrappers.map({ model in
                        return .init(type: model.type)
                    }))
                }
            } catch {
                print("❌ Failed to load/parse DashboardLayout.json:", error)
            }
        }
    }
    
    #if os(iOS)
    func startLiveActivity() {
        let chartData = model.kpiItems.
        
        let attributes = MonitorLiveAttributes(name: "Something")
        let initialState = MonitorLiveAttributes.ContentState(chartModel: model.)

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
}
