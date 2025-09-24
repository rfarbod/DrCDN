//
//  LiveActivityTypeView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import SwiftUI

public struct LiveActivityTypeView: View {
    public let model: LiveActivityTypeModel
    
    public init(model: LiveActivityTypeModel) {
        self.model = model
    }
    
    public var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(model.title)
                        .font(.title)
                        .bold()
                        .padding()
                    
                    Spacer()
                }
                
                Divider().padding()
                            
                Text(model.description)
                    .font(.body)
                    .padding()
            }
                        
            Image(systemName: model.image)
                .resizable()
                .scaledToFit()
                .frame(width: 76, height: 76)
                .padding()
        }
        .onTapGesture {
            model.onTap?()
        }
        .padding(16)
        .background(Color.cardBG)
        .cornerRadius(16)
    }
}

public struct LiveActivityTypeView_Previews: PreviewProvider {
    public static var previews: some View {
        LiveActivityTypeView(model: .init(
            title: "Pie Chart",
            description: "Start a live activity with a pie chart inside of it",
            image: "chart.pie"
        ))
    }
}
