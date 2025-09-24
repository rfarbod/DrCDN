//
//  DRTextFieldModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public enum TextFieldValidationRule: Equatable {
    case string(minLength: Int)
    case phoneNumber
    case email
}

public struct DRTextFieldModel {
    public let title: String
    public let icon: SymbolAsset
    public let placeholder: String
    public let errorText: String
    public let validationRule: TextFieldValidationRule?

    public init(
        title: String,
        icon: SymbolAsset,
        placeholder: String,
        errorText: String,
        validationRule: TextFieldValidationRule? = nil
    ) {
        self.title = title
        self.icon = icon
        self.placeholder = placeholder
        self.errorText = errorText
        self.validationRule = validationRule
    }
}
