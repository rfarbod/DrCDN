//
//  OnboardingModel.swift
//  DrCDN
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import AppUI

struct OnboardingModel {
    let items: [OnboardingStepView]
    
    init(items: [OnboardingStepView]) {
        self.items = items
    }
}
