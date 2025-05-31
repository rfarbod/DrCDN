//
//  SettingsRowView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import SwiftUI

public struct SettingsRowView: View {
    private enum Constants {
        static let rowSize: CGFloat = 16
    }
    
    public let model: SettingsRowModel
    
    public init(model: SettingsRowModel) {
        self.model = model
    }
    
    public var body: some View {
        HStack {
            Image(systemName: model.image)
                .resizable()
                .scaledToFit()
                .frame(width: Constants.rowSize, height: Constants.rowSize)
            
            Text(model.title)
                .font(.title3)
                .fontWeight(.semibold)
            
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: Constants.rowSize, height: Constants.rowSize)
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.cardBG)
        .cornerRadius(16)
    }
}
