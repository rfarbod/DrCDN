//
//  ServerStatusView.swift
//  AppUI
//
//  Created by Farbod on 6/3/25.
//

import SwiftUI

public struct ServerStatusView: View {
    let model: ServerStautsModel
    
    public init(model: ServerStautsModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(model.title)
                .fontWeight(.semibold)
                .padding([.top, .leading, .trailing])
            
            HStack() {
                Circle()
                    .foregroundStyle(model.dotColor)
                    .frame(width: 10, height: 10)
                
                Text("\(model.number)")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding([.bottom, .leading, .trailing])
        }
        .background(Color.cardBG)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

public struct ServerStatusView_Previews: PreviewProvider {
    public static var previews: some View {
        ServerStatusView(model: .init(
            title: "Total Servers",
            dotColor: Color.cyan,
            number: 1
        ))
    }
}
