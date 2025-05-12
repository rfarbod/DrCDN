//
//  KPIListView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/11/25.
//

import SwiftUI

public struct KPIListView: View {
    public let model: KPIListModel
    
    public init(
        model: KPIListModel
    ) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(model.listTitle)
                .font(.headline)
                .foregroundColor(.textHigh)
            
            ForEach(model.items.enumerated().map { $0 }, id: \.offset) { item in
                HStack {
                    Text(item.element.title)
                        .font(.body)
                        .foregroundColor(.textHigh)
                    Spacer()
                    Text(item.element.value)
                        .font(.body)
                        .foregroundColor(.textHigh)
                }
            }
        }
        .padding(16)
        .background(Color.cardBG)
        .cornerRadius(16)
    }
}
