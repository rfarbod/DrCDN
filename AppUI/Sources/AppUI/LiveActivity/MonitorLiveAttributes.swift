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
        public var barModel: KPIBarViewModel?
        public var pieModel: KPIPieModel?
        public var cardModel: KPICardModel?
        
        public init(
            barModel: KPIBarViewModel? = nil,
            pieModel: KPIPieModel? = nil,
            cardModel: KPICardModel? = nil
        ) {
            self.barModel = barModel
            self.pieModel = pieModel
            self.cardModel = cardModel
        }
    }

    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}
#endif
