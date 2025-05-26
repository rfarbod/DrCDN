//
//  MonitorLiveAttributes.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/25/25.
//

#if os(iOS)
import ActivityKit
import WidgetKit

public struct MonitorLiveAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        public var chartModel: ChartModel
        
        public init(chartModel: ChartModel) {
            self.chartModel = chartModel
        }
    }

    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}
#endif
