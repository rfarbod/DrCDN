//
//  DRTextFieldModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

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
    public let keyboardType: KeyboardType

    public enum KeyboardType: Equatable {
        case `default`
        case emailAddress
        case phonePad
        case numberPad
    }

    public init(
        title: String,
        icon: SymbolAsset,
        placeholder: String,
        errorText: String,
        validationRule: TextFieldValidationRule? = nil,
        keyboardType: KeyboardType = .default
    ) {
        self.title = title
        self.icon = icon
        self.placeholder = placeholder
        self.errorText = errorText
        self.validationRule = validationRule
        self.keyboardType = keyboardType
    }
}

#if canImport(UIKit)
extension DRTextFieldModel.KeyboardType {
    var uiValue: UIKeyboardType {
        switch self {
        case .default:
            return .default
        case .emailAddress:
            return .emailAddress
        case .phonePad:
            return .phonePad
        case .numberPad:
            return .numberPad
        }
    }
}
#endif
