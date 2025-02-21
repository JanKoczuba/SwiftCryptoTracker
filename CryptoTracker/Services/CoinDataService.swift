//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by Jan Koczuba on 20/02/2025.
//

import Foundation

class CoinDataService {

    func getCoins() async throws -> [CoinModel] {

        let url = URL(
            string: "https://api.coingecko.com/api/v3/coins/markets")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "order", value: "market_cap_desc"),
            URLQueryItem(name: "per_page", value: "250"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "sparkline", value: "true"),
            URLQueryItem(name: "price_change_percentage", value: "24"),
        ]
        components.queryItems =
            components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "x-cg-demo-api-key": apiKey,
        ]
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode([CoinModel].self, from: data)
        } catch {
            print("Error while fetching data")
        }
        return []
    }
}
