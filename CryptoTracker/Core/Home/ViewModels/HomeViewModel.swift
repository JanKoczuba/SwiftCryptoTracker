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

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(coinMocks)
            self.portfolioCoins.append(coinMocks)
        }

    }

}
