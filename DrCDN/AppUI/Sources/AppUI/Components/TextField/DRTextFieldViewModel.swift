//
//  DRTextFieldViewModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//
import Foundation
import SwiftUI

public final class DRTextFieldViewModel: ObservableObject {
    @Published public var text: String
    @Published public var isError: Bool
    public var onCommit: ((String) -> Void)?

    public init(text: String = "", isError: Bool = false, onCommit: ((String) -> Void)? = nil) {
        self.text = text
        self.isError = isError
        self.onCommit = onCommit
    }

    public func setError(_ flag: Bool) {
        guard isError != flag else { return }
        isError = flag
    }

    public func commit() {
        onCommit?(text)
    }
}
