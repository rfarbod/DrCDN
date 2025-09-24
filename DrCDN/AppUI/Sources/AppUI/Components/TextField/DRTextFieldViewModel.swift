//
//  DRTextFieldViewModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import AppFoundation
import Foundation
import SwiftUI

@MainActor
public final class DRTextFieldViewModel: ObservableObject {
    @Published public private(set) var text: String = ""
    @Published public private(set) var isError: Bool = false
    @Published public private(set) var errorMessage: String?

    public var onCommit: ((String) -> Void)?

    private var validationRule: TextFieldValidationRule?
    private var defaultErrorText: String
    private let validator: any ValidatorProtocol

    public init(
        validationRule: TextFieldValidationRule? = nil,
        defaultErrorText: String,
        validator: any ValidatorProtocol = AppValidationService()
    ) {
        self.validationRule = validationRule
        self.defaultErrorText = defaultErrorText
        self.validator = validator
        validate()
    }

    public func configure(validationRule: TextFieldValidationRule?, defaultErrorText: String) {
        self.validationRule = validationRule
        self.defaultErrorText = defaultErrorText
        validate()
    }

    public func update(text: String) {
        guard self.text != text else { return }
        self.text = text
        validate()
    }

    public func setError(_ flag: Bool, message: String? = nil) {
        isError = flag
        errorMessage = flag ? (message ?? defaultErrorText) : nil
    }

    public func commit() {
        onCommit?(text)
    }

    private func validate() {
        guard let rule = validationRule else {
            setError(false)
            return
        }

        let result = validator.validate(text, rule: rule, defaultError: defaultErrorText)
        if result.isValid {
            setError(false)
        } else {
            setError(true, message: result.errorMessage)
        }
    }
}
