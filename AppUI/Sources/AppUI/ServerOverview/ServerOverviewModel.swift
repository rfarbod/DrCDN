//
//  ServerOverv.swift
//  AppUI
//
//  Created by Farbod on 6/3/25.
//

import Foundation
import SwiftUI

public enum ServerState {
    case running
    case error
    case connecting
    
    public var color: Color {
        switch self {
        case .running:
            return Color.green
        case .error:
            return Color.red
        case .connecting:
            return Color.yellow
        }
    }
}

public struct ServerOverviewModel: Identifiable {
    public let id: String = UUID().uuidString
    public let title: String
    public let state: ServerState
    public let coreCount: Int
    public let ram: Double
    public let storage: Double
    public let uptime: Int
    public let cpuLoad: Double
    public let memoryLoad: Double
    public let networkDownload: Double
    public let networkUpload: Double
    public let diskRead: Double
    public let diskWrite: Double
    
    public init(title: String, state: ServerState, coreCount: Int, ram: Double, storage: Double, uptime: Int, cpuLoad: Double, memoryLoad: Double, networkDownload: Double, networkUpload: Double, diskRead: Double, diskWrite: Double) {
        self.title = title
        self.state = state
        self.coreCount = coreCount
        self.ram = ram
        self.storage = storage
        self.uptime = uptime
        self.cpuLoad = cpuLoad
        self.memoryLoad = memoryLoad
        self.networkDownload = networkDownload
        self.networkUpload = networkUpload
        self.diskRead = diskRead
        self.diskWrite = diskWrite
    }
}
