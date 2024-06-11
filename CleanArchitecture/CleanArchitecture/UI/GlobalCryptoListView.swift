//
//  GlobalCryptoListView.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import SwiftUI

struct GlobalCryptoListView: View {
    
    @ObservedObject private var viewModel: GlobalCryptoListViewModel
    
    init(viewModel: GlobalCryptoListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                viewModel.getCryptos()
            }
            .refreshable {
                viewModel.getCryptos()
            }
    }
    
    @ViewBuilder
    var content: some View {
        VStack {
            if let errorMsg = viewModel.errorMessage {
                VStack(spacing: 24) {
                    Text(errorMsg)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.black)
                    Button {
                        viewModel.getCryptos()
                    } label: {
                        Text("RETRY")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.black)
                            .padding(14)
                            .background(.cyan)
                            .clipShape(Capsule())
                    }
                }
            } else {
                VStack {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        if viewModel.cryptos.count > 0 {
                            List {
                                ForEach(viewModel.cryptos, id: \.id) { crypto in
                                    CryptoListItemView(item: crypto)
                                }
                            }
                        } else {
                            Text("No items to show")
                                .font(.title)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GlobalCryptoListView(viewModel: .preview)
}
