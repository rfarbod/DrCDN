//
//  MonitorLiveLiveActivity.swift
//  MonitorLive
//
//  Created by Farbod Rahiminik on 5/25/25.
//

import AppUI
import ActivityKit
import WidgetKit

struct MonitorLiveLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MonitorLiveAttributes.self) { context in
            VStack {
                if let barModel = context.state.barModel {
                    KPIBarView(model: barModel)
                }
                
                if let pieModel = context.state.pieModel {
                    KPIPieChart(model: .init(
                        slices: pieModel.chartData?.slices ?? [],
                        frame: .init(
                            width: 75,
                            height: 75
                        )
                    ))
                }
                
                if let cardModel = context.state.cardModel {
                    KPICardView(model: cardModel)
                }
            }
            .activityBackgroundTint(Color.primaryBackground)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    if let barModel = context.state.barModel {
                        KPIBarView(model: barModel)
                    }
                    
                    if let pieModel = context.state.pieModel {
                        KPIPieChart(model: .init(
                            slices: pieModel.chartData?.slices ?? [],
                            frame: .init(
                                width: 75,
                                height: 75
                            )
                        ))
                    }
                    
                    if let cardModel = context.state.cardModel {
                        KPICardView(model: cardModel)
                    }
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("Monitoring")
            } minimal: {
                Text("Monitoring")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MonitorLiveAttributes {
    fileprivate static var preview: MonitorLiveAttributes {
        MonitorLiveAttributes(name: "World")
    }
}
