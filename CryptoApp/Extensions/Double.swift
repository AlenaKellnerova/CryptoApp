//
//  Double.swift
//  CryptoApp
//
//  Created by Heimdal Data on 18.06.2025.
//

import Foundation


extension Double {
    
    /// Converts a double into a Currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to 1,234.56 $
    /// Convert 12.3456 to 12.3456 $
    /// Convert 0.123456 to 0.123456 $
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current  // default value
        formatter.currencyCode = "USD" // to override the currency
        formatter.currencySymbol = "$"  // to override the currency symbol
        formatter.maximumFractionDigits = 6
        formatter.minimumFractionDigits = 2
        return formatter
    }
    
    /// Converts a double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "1,234.56 $"
    /// Convert 12.3456 to "12.3456 $"
    /// Convert 0.123456 to "0.123456 $"
    /// ```
    func asFormattedCurrency6() -> String {
        return currencyFormatter6.string(from: NSNumber(value: self)) ?? "0.00 $"
    }
    
    /// Converts a double into a Currency with 2 decimal places
    /// ```
    /// Convert 1234.56 to 1,234.56 $
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current  // default value
        formatter.currencyCode = "USD" // to override the currency
        formatter.currencySymbol = "$"  // to override the currency symbol
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
    
    /// Converts a double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "1,234.56 $"
    /// ```
    func asFormattedCurrency2() -> String {
        return currencyFormatter2.string(from: NSNumber(value: self)) ?? "0.00 $"
    }
    
    /// Converts a double into a String representation
    /// ```
    /// Convert 1234.56789 to "1234.56"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a double into a String representation with %
    /// ```
    /// Convert 1234.56789 to "1234.56%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
}
