//
//  LiveActivityTestViewModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import Combine
import Foundation

final class LiveActivityTestViewModel: ObservableObject {
    @Published var model: LiveActivityTestModel
    
    init(model: LiveActivityTestModel) {
        self.model = model
    }
    
    func getLiveActivityTypes() {
        model.types = [
            .init(
                id: UUID().uuidString,
                title: "Pie Chart",
                description: "Start a live activity with a pie chart inside of it",
                image: "chart.pie"
            ),
            .init(
                id: UUID().uuidString,
                title: "Bar Chart",
                description: "Start a live activity with a bar chart inside of it",
                image: "chart.bar"
            )
        ]
    }
}
