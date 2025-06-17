//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by Heimdal Data on 16.06.2025.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
//    @State private var animate: Bool = false
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 100, height: 100)
}
