//
//  DeviceNodesModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

public struct DeviceNodesModel {
    public let deviceName: String
    public let nodes: [NodeModel]
    
    public init(deviceName: String, nodes: [NodeModel]) {
        self.deviceName = deviceName
        self.nodes = nodes
    }
}
