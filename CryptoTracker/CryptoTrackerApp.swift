//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Jan Koczuba on 20/02/2025.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {

    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
