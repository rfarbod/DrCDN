//
//  LiveActivityTestView.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 5/31/25.
//

import AppUI

struct LiveActivityTestView: View {
    @ObservedObject var viewModel: LiveActivityTestViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.model.types) { type in
                LiveActivityTypeView(model: type)
            }
            .padding()
        }
        .onAppear {
            viewModel.getLiveActivityTypes()
        }
        .background(Color.primaryBackground)
    }
}

struct liveactivitytestview_Previews: PreviewProvider {
    static var previews: some View {
        LiveActivityTestView(viewModel: .init(model: .init(types: [])))
    }
}
