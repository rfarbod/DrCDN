//
//  MonitorLiveLiveActivity.swift
//  MonitorLive
//
//  Created by Farbod Rahiminik on 5/25/25.
//

import AppUI
import ActivityKit
import WidgetKit
import SwiftUI

struct MonitorLiveLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MonitorLiveAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                SparklineChartView(data: context.state.chartModel)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Is Monitoring")
                    // more content
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
