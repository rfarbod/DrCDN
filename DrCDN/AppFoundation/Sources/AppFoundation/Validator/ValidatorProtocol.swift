//
//  ValidatorProtocol.swift
//  AppFoundation
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public enum ValidationRule: Equatable {
    case string(minLength: Int)
    case phoneNumber
    case email
    case password(minLength: Int)
}

public struct ValidationResult: Equatable {
    public let isValid: Bool
    public let errorMessage: String?

    public init(isValid: Bool, errorMessage: String? = nil) {
        self.isValid = isValid
        self.errorMessage = errorMessage
    }
}

public protocol ValidatorProtocol {
    func validate(_ text: String, rule: ValidationRule, defaultError: String) -> ValidationResult
}
