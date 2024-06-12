//
//  CryptoDetailHeaderView.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import SwiftUI

struct CryptoDetailHeaderView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Bitcoin")
                        .font(.title)
                    Text("BTC")
                        .font(.title)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("23.934$")
                        .font(.title)
                    Text("1.45%")
                        .font(.headline)
                }
            }
            .padding(.bottom, 8)
            HStack {
                Text("Market cap:")
                    .font(.headline)
                Spacer()
                Text("121313124$")
                    .font(.headline)
            }
            HStack {
                Text("24h volume:")
                    .font(.headline)
                Spacer()
                Text("121313124$")
                    .font(.headline)
            }
        }
        
    }
}

#Preview {
    CryptoDetailHeaderView()
}
