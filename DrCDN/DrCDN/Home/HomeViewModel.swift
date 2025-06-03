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
                
                let mappedWrappers = Mapper.mapToKPIWrapperModel(wrappers)
                
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
}
