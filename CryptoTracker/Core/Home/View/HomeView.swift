//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Jan Koczuba on 20/02/2025.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false

    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()

            VStack {
                homeHeader

                columnTitles

                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }

    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)

    }
    .environmentObject(HomeViewModel())
}

extension HomeView {

    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: UUID())
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.accent)
                .animation(.none, value: UUID())

            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }

        }
        .padding(.horizontal)
    }

    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(
                        .init(
                            top: 10, leading: 0, bottom: 10,
                            trailing: 10))

            }
        }
        .listStyle(PlainListStyle())
    }

    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(
                        .init(
                            top: 10, leading: 0, bottom: 10,
                            trailing: 10))

            }
        }
        .listStyle(PlainListStyle())
    }

    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(
                    width: UIScreen.main.bounds.width / 3.5,
                    alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.secondaryText)
        .padding(.horizontal)
    }

}
