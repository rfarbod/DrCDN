//
//  HomeView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import AppUI
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = .init()

    private let filters: [FilterModel] = [
        .init(title: "Group By", placeholder: "OS", onTap: {}),
        .init(title: "Color By", placeholder: "Status", onTap: {}),
        .init(title: "Source By", placeholder: "Cloud Provider", onTap: {}),
        .init(title: "Device IP/Name", placeholder: "Device Name", onTap: {}),
        .init(title: "Expert Mode", placeholder: "Off", onTap: {})
    ]

    private let legendsModel = LegendsModel(
        items: [
            .init(title: "Live", color: AppUIAssets.primaryGreen),
            .init(title: "Offline", color: AppUIAssets.textFieldBorder),
            .init(title: "Stale", color: AppUIAssets.textFieldPlaceholder),
            .init(title: "Unseen", color: AppUIAssets.cardBG)
        ]
    )

    private let deviceNodesModel = DeviceNodesModel(
        deviceName: "Linux",
        nodes: [
            .init(innerColor: AppUIAssets.primaryGreen, outerColor: AppUIAssets.secondaryAccent),
            .init(innerColor: AppUIAssets.textMed, outerColor: AppUIAssets.textFieldBorder),
            .init(innerColor: AppUIAssets.textFieldPlaceholder, outerColor: AppUIAssets.secondaryAccent),
            .init(innerColor: AppUIAssets.surface, outerColor: AppUIAssets.textMed),
            .init(innerColor: AppUIAssets.primaryAccent, outerColor: AppUIAssets.textFieldBorder),
            .init(innerColor: AppUIAssets.textFieldPlaceholder, outerColor: AppUIAssets.cardBG),
            .init(innerColor: AppUIAssets.primaryGreen, outerColor: AppUIAssets.primaryAccent)
        ]
    )

    private let resourceUsageModels: [ResourceUsageModel] = [
        .init(title: "CPU Usage", icon: AppUIAssets.textFieldUser, usage: 47, changePercentage: 4, description: "3.8GHz | 12 Cores"),
        .init(title: "Storage", icon: AppUIAssets.textFieldUser, usage: 69, changePercentage: -2, description: "16.4 GB / 24 GB"),
        .init(title: "Network", icon: AppUIAssets.textFieldUser, usage: 69, changePercentage: -2, description: "16.4 GB / 24 GB")
    ]

    private let processesModel = ProcessesModel(
        items: Array(
            repeating: ProcessModel(pid: "1824", processName: "system_core.exe", user: "SYSTEM", cpuUsage: "12.8%"),
            count: 6
        )
    )

    private let twoColumnLayout = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 28) {
                header
                segments
                metricsRow
                filterRow(models: Array(filters.prefix(2)))
                nodeSummarySection
                filterRow(models: Array(filters[2...3]))
                expertToggle
                resourceUsageSection
                processesSection
            }
            .padding(.horizontal, 24)
            .padding(.top, 32)
            .padding(.bottom, 48)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Image("primaryBackground"))
    }

    private var header: some View {
        HStack(alignment: .center, spacing: 20) {
            HStack(spacing: 12) {
                Image(asset: DrCDNAssets.minimalLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                Text("Project Name")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color.textHigh)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 18)
            .background(Color.textFieldBackground)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

            Spacer(minLength: 0)

            HStack(spacing: 16) {
                CircularIconButton(model: .init(icon: DrCDNAssets.bell.swiftUIImage, onTap: {}))
                CircularIconButton(model: .init(icon: DrCDNAssets.profile.swiftUIImage, onTap: {}))
            }
        }
    }

    private var segments: some View {
        SegmentsView(
            model: .init(
                items: [
                    SegmentModel(title: "Overview", isSelected: true) { _ in },
                    SegmentModel(title: "Metrics", isSelected: false) { _ in },
                    SegmentModel(title: "Logs", isSelected: false) { _ in },
                    SegmentModel(title: "Relation", isSelected: false) { _ in },
                    SegmentModel(title: "Tickets", isSelected: false) { _ in }
                ]
            )
        )
    }

    private var metricsRow: some View {
        LazyVGrid(columns: twoColumnLayout, spacing: 20) {
            SummaryTileView(
                model: .init(
                    items: [
                        SummaryItem(title: "Total nodes", value: 36, isMain: true),
                        SummaryItem(title: "Live", value: 25),
                        SummaryItem(title: "Offline", value: 4),
                        SummaryItem(title: "Stale", value: 7)
                    ]
                )
            )
            MetricDisturbutationView(
                model: .init(
                    title: "Active Alert",
                    breakdown: [
                        .init(kind: .critical, value: 4),
                        .init(kind: .warning, value: 19)
                    ]
                )
            )
        }
    }

    private func filterRow(models: [FilterModel]) -> some View {
        LazyVGrid(columns: twoColumnLayout, spacing: 20) {
            if models.count == 1, let model = models.first {
                FilterView(model: model)
                    .frame(maxWidth: .infinity)
                    .gridCellColumns(2)
            } else {
                ForEach(models.indices, id: \.self) { index in
                    FilterView(model: models[index])
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }

    private var nodeSummarySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            LegendsView(model: legendsModel)
            DeviceNodesView(model: deviceNodesModel)
            DeviceNodesView(model: deviceNodesModel)
            DeviceNodesView(model: deviceNodesModel)
            DeviceNodesView(model: deviceNodesModel)
            DeviceNodesView(model: deviceNodesModel)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var expertToggle: some View {
        FilterView(model: filters[4])
            .frame(maxWidth: 160)
    }

    private var resourceUsageSection: some View {
        LazyVGrid(columns: twoColumnLayout, spacing: 20) {
            ResourceUsageView(model: resourceUsageModels[0])
                .frame(maxWidth: .infinity)
                .gridCellColumns(2)

            ResourceUsageView(model: resourceUsageModels[1])
                .frame(maxWidth: .infinity)

            ResourceUsageView(model: resourceUsageModels[2])
                .frame(maxWidth: .infinity)
        }
    }

    private var processesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ProcessesView(model: processesModel)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HomeView()
}
