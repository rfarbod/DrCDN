// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum AppFoundationLocalized {
  public enum Validation {
    public enum Error {
      /// Invalid input
      public static let generic = AppFoundationLocalized.tr("Localizable", "validation.error.generic", fallback: "Invalid input")
      public enum Password {
        /// Password is too common or appears in breach lists.
        public static let common = AppFoundationLocalized.tr("Localizable", "validation.error.password.common", fallback: "Password is too common or appears in breach lists.")
        /// Password must be at least %d characters long.
        public static func length(_ p1: Int) -> String {
          return AppFoundationLocalized.tr("Localizable", "validation.error.password.length", p1, fallback: "Password must be at least %d characters long.")
        }
        /// Password cannot contain obvious sequences or repeated patterns.
        public static let sequence = AppFoundationLocalized.tr("Localizable", "validation.error.password.sequence", fallback: "Password cannot contain obvious sequences or repeated patterns.")
        /// Password must include at least three of the following: uppercase letters, lowercase letters, numbers, special characters.
        public static let variety = AppFoundationLocalized.tr("Localizable", "validation.error.password.variety", fallback: "Password must include at least three of the following: uppercase letters, lowercase letters, numbers, special characters.")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension AppFoundationLocalized {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = Bundle.module.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
