//
//  KPIWrapperModel.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/12/25.
//

import Foundation

// MARK: – Dynamic Wrapper

public struct KPIWrapperModel: Codable {
    public let type: KPIViewType

    enum CodingKeys: String, CodingKey {
        case type, model
    }

    public init(type: KPIViewType) {
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeName = try container.decode(String.self, forKey: .type)

        switch typeName {
        case "kpiBar":
            let barModel = try container.decode(KPIBarViewModel.self, forKey: .model)
            self.type = .kpiBar(barModel)

        case "kpiCard":
            let cardModel = try container.decode(KPICardModel.self, forKey: .model)
            self.type = .kpiCard(cardModel)

        case "kpiComparisson":
            let cmp = try container.decode(KPIComparisonChartCardModel.self, forKey: .model)
            self.type = .kpiComparisson(cmp)

        case "kpiList":
            let listModel = try container.decode(KPIListModel.self, forKey: .model)
            self.type = .kpiList(listModel)

        case "kpiPie":
            let pieModel = try container.decode(KPIPieModel.self, forKey: .model)
            self.type = .kpiPie(pieModel)

        default:
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: container,
                debugDescription: "Unknown KPI type: \(typeName)"
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch type {
        case .kpiBar(let bar):
            try container.encode("kpiBar", forKey: .type)
            try container.encode(bar, forKey: .model)

        case .kpiCard(let card):
            try container.encode("kpiCard", forKey: .type)
            try container.encode(card, forKey: .model)

        case .kpiComparisson(let cmp):
            try container.encode("kpiComparisson", forKey: .type)
            try container.encode(cmp, forKey: .model)

        case .kpiList(let list):
            try container.encode("kpiList", forKey: .type)
            try container.encode(list, forKey: .model)

        case .kpiPie(let pie):
            try container.encode("kpiPie", forKey: .type)
            try container.encode(pie, forKey: .model)
        }
    }
}

// MARK: – Enum of Cases

public enum KPIViewType {
    case kpiBar(KPIBarViewModel)
    case kpiCard(KPICardModel)
    case kpiComparisson(KPIComparisonChartCardModel)
    case kpiList(KPIListModel)
    case kpiPie(KPIPieModel)
}

// MARK: – Make your existing models Codable

extension KPIBarViewModel: Codable {}
extension KPICardModel: Codable {}
extension KPIComparisonChartCardModel: Codable {}
extension KPIListModel: Codable {}
extension KPIPieModel: Codable {}

// Also make any nested types Codable:
extension ChartModel: Codable {}
extension PieChartModel: Codable {}
extension PieChartModel.Slice: Codable {}
