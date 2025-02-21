//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by Jan Koczuba on 20/02/2025.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []

    private let dataService = CoinDataService()

    init() {
        Task { @MainActor in
            let fetchedData = try await dataService.getCoins()
            allCoins = fetchedData
        }
    }
}
