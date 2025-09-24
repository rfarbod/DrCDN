//
//  DRTextFieldViewModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//
import Foundation
import SwiftUI

@MainActor
public final class DRTextFieldViewModel: ObservableObject {
    @Published public private(set) var text: String = ""
    @Published public private(set) var isError: Bool = false

    public var onCommit: ((String) -> Void)?
    private var validationRule: TextFieldValidationRule?

    public init(validationRule: TextFieldValidationRule? = nil) {
        self.validationRule = validationRule
        validate()
    }

    public func configure(validationRule: TextFieldValidationRule?) {
        self.validationRule = validationRule
        validate()
    }

    public func update(text: String) {
        guard self.text != text else { return }
        self.text = text
        validate()
    }

    public func setError(_ flag: Bool) {
        guard isError != flag else { return }
        isError = flag
    }

    public func commit() {
        onCommit?(text)
    }

    private func validate() {
        guard let rule = validationRule else {
            setError(false)
            return
        }

        let isValid: Bool

        switch rule {
        case .string(let minLength):
            isValid = text.count >= minLength
        case .phoneNumber:
            isValid = DRTextFieldViewModel.phonePredicate.evaluate(with: text)
        case .email:
            isValid = DRTextFieldViewModel.emailPredicate.evaluate(with: text)
        }

        setError(!isValid)
    }
}

private extension DRTextFieldViewModel {
    static let phonePredicate: NSPredicate = {
        let pattern = "^\\+?[0-9]{7,15}$"
        return NSPredicate(format: "SELF MATCHES %@", pattern)
    }()

    static let emailPredicate: NSPredicate = {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", pattern)
    }()
}
