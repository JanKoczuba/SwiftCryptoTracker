//
//  CircleButtonVIew.swift
//  CryptoTracker
//
//  Created by Jan Koczuba on 20/02/2025.
//

import SwiftUI

struct CircleButtonView: View {

    let iconName: String

    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.background)
            )
            .shadow(
                color: .accent.opacity(0.25),
                radius: 10
            )
            .padding()

    }
}

#Preview(traits: .sizeThatFitsLayout) {

    CircleButtonView(iconName: "heart.fill")
        .padding()
}
