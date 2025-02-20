//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by Jan Koczuba on 20/02/2025.
//

import SwiftUI

struct CoinRowView: View {

    let coin: CoinModel
    let showHoldingsColumn: Bool

    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: coinMocks, showHoldingsColumn: true)
}

extension CoinRowView {

    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(.accent)
        }

    }

    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asPercentString())
        }
        .foregroundColor(.accent)
    }

    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(.accent)

            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0
                        ? .accentGreen : .accentRed
                )
        }
        .frame(
            width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)

    }

}
