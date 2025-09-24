// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum AppUILocalized {
  public enum DrTextField {
    public enum Error {
      /// This is an input helper text.
      public static let `default` = AppUILocalized.tr("Localizable", "drTextField.error.default", fallback: "This is an input helper text.")
    }
    public enum Placeholder {
      /// Placeholder Text
      public static let userName = AppUILocalized.tr("Localizable", "drTextField.placeholder.userName", fallback: "Placeholder Text")
    }
    public enum Title {
      /// User Name
      public static let userName = AppUILocalized.tr("Localizable", "drTextField.title.userName", fallback: "User Name")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension AppUILocalized {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = Bundle.module.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
