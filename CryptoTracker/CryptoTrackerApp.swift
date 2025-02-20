//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Jan Koczuba on 20/02/2025.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
