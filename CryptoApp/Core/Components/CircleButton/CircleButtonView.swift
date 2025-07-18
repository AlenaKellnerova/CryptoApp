//
//  CircleButtonView.swift
//  CryptoApp
//
//  Created by Heimdal Data on 16.06.2025.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent, radius: 10
            )
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "info")
}
