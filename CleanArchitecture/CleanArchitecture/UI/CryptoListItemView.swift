//
//  CryptoListItemView.swift
//  CleanArchitecture
//
//  Created by manueltirado on 11/6/24.
//

import SwiftUI

struct CryptoListItemView: View {
    
    let item: CryptoListPresentableItem
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.title3)
                        .lineLimit(1)
                    Text(item.symbol)
                        .font(.headline)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(item.price)
                        .font(.headline)
                        .lineLimit(1)
                    Text(item.price24h)
                        .font(.headline)
                        .foregroundStyle(item.isPriceChangePositive ?
                            .green : .red)
                }
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Market cap:")
                        .font(.system(size: 10))
                        .lineLimit(1)
                    Text("24h:")
                        .font(.system(size: 10))
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text(item.marketCap)
                        .font(.system(size: 10))
                        .lineLimit(1)
                    Text(item.volume24h)
                        .font(.system(size: 10))
                }
            }
        }
    }
}

#Preview {
    CryptoListItemView(item: .init(domainModel: .init(id: "btc",
                                                      name: "Bitcoin",
                                                      symbol: "btc",
                                                      price: 24000.43,
                                                      price24h: 1.23,
                                                      volume24h: 340000000,
                                                      marketCap: 133100000)))
}
