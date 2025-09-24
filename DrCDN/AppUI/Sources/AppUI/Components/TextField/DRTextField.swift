//
//  DRTextField.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 9/24/25.
//

import SwiftUI

public struct DRTextField: View {
    private enum Constants {
        static let labelSpacing: CGFloat = 6
        static let errorSpacing: CGFloat = 4
        static let iconSpacing: CGFloat = 12
        static let fieldHorizontalInset: CGFloat = 16
        static let fieldHeight: CGFloat = 52
        static let iconSize: CGFloat = 20
        static let borderWidth: CGFloat = 1
        static let cornerRadius: CGFloat = 14
        static let titleFontSize: CGFloat = 13
        static let textFontSize: CGFloat = 15
        static let errorFontSize: CGFloat = 11
    }
    
    private let model: DRTextFieldModel

    @StateObject private var viewModel: DRTextFieldViewModel
    @FocusState private var isFocused: Bool

    private var borderColor: Color {
        if viewModel.isError { return .textFieldError }
        return isFocused ? .secondaryAccent : .textFieldBorder
    }

    public init(model: DRTextFieldModel) {
        self.model = model
        _viewModel = StateObject(wrappedValue: DRTextFieldViewModel(validationRule: model.validationRule))
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.labelSpacing) {
            Text(model.title)
                .font(.system(size: Constants.titleFontSize, weight: .semibold))
                .foregroundStyle(Color.textFieldTitle)

            VStack(alignment: .leading, spacing: Constants.errorSpacing) {
                fieldContent

                if viewModel.isError {
                    Text(model.errorText)
                        .font(.system(size: Constants.errorFontSize, weight: .regular))
                        .foregroundStyle(Color.textFieldError)
                        .transition(.opacity)
                }
            }
        }
        .animation(.easeInOut(duration: 0.2), value: viewModel.isError)
        .animation(.easeInOut(duration: 0.2), value: isFocused)
        .onChange(of: model.validationRule) { _, newRule in
            viewModel.configure(validationRule: newRule)
        }
    }

    private var fieldContent: some View {
        HStack(spacing: Constants.iconSpacing) {
            Image(asset: model.icon)
                .resizable()
                .scaledToFit()
                .frame(width: Constants.iconSize, height: Constants.iconSize)
                .foregroundStyle(Color.textFieldPlaceholder)

            ZStack(alignment: .leading) {
                if viewModel.text.isEmpty {
                    Text(model.placeholder)
                        .font(.system(size: Constants.textFontSize))
                        .foregroundStyle(Color.textFieldPlaceholder)
                }

                TextField("", text: Binding(
                    get: { viewModel.text },
                    set: { newValue in viewModel.update(text: newValue) }
                ))
                    .font(.system(size: Constants.textFontSize))
                    .foregroundStyle(Color.textHigh)
                    .focused($isFocused)
                    .submitLabel(.done)
                    .onSubmit { viewModel.commit() }
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
        }
        .padding(.horizontal, Constants.fieldHorizontalInset)
        .frame(height: Constants.fieldHeight)
        .background(Color.textFieldBackground)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(borderColor, lineWidth: Constants.borderWidth)
        )
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
}

#Preview("DRTextField") {
    DRTextField(
        model: .init(
            title: AppUILocalized.DrTextField.Title.userName,
            icon: AppUIAssets.textFieldUser,
            placeholder: AppUILocalized.DrTextField.Placeholder.userName,
            errorText: AppUILocalized.DrTextField.Error.default,
            validationRule: .string(minLength: 4)
        )
    )
    .padding()
    .frame(width: 320)
}
