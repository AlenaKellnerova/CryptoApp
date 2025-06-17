//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Heimdal Data on 12.06.2025.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
