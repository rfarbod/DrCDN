//
//  ValidationService.swift
//  AppFoundation
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import Foundation

public struct AppValidationService: ValidatorProtocol {
    public init() {}

    public func validate(_ text: String, rule: ValidationRule, defaultError: String) -> ValidationResult {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)

        let message: String?

        switch rule {
        case .string(let minLength):
            message = trimmed.count >= minLength ? nil : defaultError
        case .phoneNumber:
            message = Self.matches(trimmed, pattern: "^\\+?[0-9]{7,15}$") ? nil : defaultError
        case .email:
            message = Self.matches(trimmed, pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") ? nil : defaultError
        case .password(let minLength):
            message = Self.passwordValidationError(for: trimmed, minLength: minLength)
        }

        return ValidationResult(isValid: message == nil, errorMessage: message)
    }
}

private extension AppValidationService {
    static func matches(_ value: String, pattern: String) -> Bool {
        value.range(of: pattern, options: [.regularExpression]) != nil
    }

    static let passwordSpecialCharacters = CharacterSet(charactersIn: "!@#$%^&*()-_=+[]{}|;:'\"`,.<>/?~")

    static let commonPasswords: Set<String> = [
        "password", "123456", "123456789", "12345678", "qwerty", "111111",
        "123123", "abc123", "password1", "1234", "letmein", "admin",
        "welcome", "iloveyou", "12345", "000000", "abcdefg", "654321"
    ]

    static func passwordValidationError(for value: String, minLength: Int) -> String? {
        guard value.count >= minLength else {
            return AppFoundationLocalized.Validation.Error.Password.length(minLength)
        }

        let categories: [CharacterSet] = [
            .uppercaseLetters,
            .lowercaseLetters,
            .decimalDigits,
            passwordSpecialCharacters
        ]

        let matchedCategories = categories.reduce(into: 0) { result, set in
            if value.rangeOfCharacter(from: set) != nil {
                result += 1
            }
        }

        guard matchedCategories >= 3 else {
            return AppFoundationLocalized.Validation.Error.Password.variety
        }

        let lowered = value.lowercased()
        guard !commonPasswords.contains(lowered) else {
            return AppFoundationLocalized.Validation.Error.Password.common
        }

        guard !isSequentialOrRepeated(lowered) else {
            return AppFoundationLocalized.Validation.Error.Password.sequence
        }

        return nil
    }

    static func isSequentialOrRepeated(_ value: String) -> Bool {
        if value.isEmpty { return false }
        if Set(value).count == 1 { return true }

        let scalars = value.unicodeScalars.map { Int($0.value) }
        var deltas: Set<Int> = []
        for index in 1..<scalars.count {
            deltas.insert(scalars[index] - scalars[index - 1])
        }
        if deltas.count == 1, let delta = deltas.first, abs(delta) == 1 {
            return true
        }

        let length = value.count
        if length >= 4 {
            for size in 1...(length / 2) {
                guard length % size == 0 else { continue }
                let chunk = value.prefix(size)
                if chunk.isEmpty { continue }
                let chunkString = String(chunk)
                if String(repeating: chunkString, count: length / size) == value {
                    return true
                }
            }
        }

        return false
    }
}
