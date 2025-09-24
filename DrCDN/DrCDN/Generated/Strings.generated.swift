// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum DrCDNLocalized {
  public enum Onboarding {
    public enum Step1 {
      /// Intelligent recommendations for performance improvement, error reduction, resource optimization, and system response quality assessment.
      public static let description = DrCDNLocalized.tr("Localizable", "onboarding.step1.description", fallback: "Intelligent recommendations for performance improvement, error reduction, resource optimization, and system response quality assessment.")
      /// Data-driven intelligent decision-making
      public static let title = DrCDNLocalized.tr("Localizable", "onboarding.step1.title", fallback: "Data-driven intelligent decision-making")
    }
    public enum Step2 {
      /// The Doctor Monitor application enables you to monitor the health and performance of your servers at all times and from any location.
      public static let description = DrCDNLocalized.tr("Localizable", "onboarding.step2.description", fallback: "The Doctor Monitor application enables you to monitor the health and performance of your servers at all times and from any location.")
      /// Confidently manage your resources
      public static let title = DrCDNLocalized.tr("Localizable", "onboarding.step2.title", fallback: "Confidently manage your resources")
    }
    public enum Step3 {
      /// Ready to leave your worries behind and manage your servers with full confidence
      public static let description = DrCDNLocalized.tr("Localizable", "onboarding.step3.description", fallback: "Ready to leave your worries behind and manage your servers with full confidence")
      /// Your monitoring journey starts now!
      public static let title = DrCDNLocalized.tr("Localizable", "onboarding.step3.title", fallback: "Your monitoring journey starts now!")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension DrCDNLocalized {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
