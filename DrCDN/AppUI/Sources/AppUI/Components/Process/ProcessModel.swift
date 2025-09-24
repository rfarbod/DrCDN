//
//  ProcessModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct ProcessModel: Identifiable, Equatable {
    public let id: UUID
    public let pid: String
    public let processName: String
    public let user: String
    public let cpuUsage: String

    public init(
        id: UUID = UUID(),
        pid: String,
        processName: String,
        user: String,
        cpuUsage: String
    ) {
        self.id = id
        self.pid = pid
        self.processName = processName
        self.user = user
        self.cpuUsage = cpuUsage
    }
}
