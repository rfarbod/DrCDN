//
//  OnboardingStepModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//
import SwiftUI

public struct OnboardingStepModel {
    public let image: Image
    public let title: String
    public let description: String
    public let ctaText: String
    public let onTap: () -> Void
    
    public init(
        image: Image,
        title: String,
        description: String,
        ctaText: String,
        onTap: @escaping () -> Void
    ) {
        self.image = image
        self.title = title
        self.description = description
        self.ctaText = ctaText
        self.onTap = onTap
    }
}
