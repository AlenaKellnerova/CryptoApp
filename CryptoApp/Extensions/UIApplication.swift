//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Heimdal Data on 03.07.2025.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
