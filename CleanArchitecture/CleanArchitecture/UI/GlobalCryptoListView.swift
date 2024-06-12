//
//  GlobalCryptoListView.swift
//  CleanArchitecture
//
//  Created by manueltirado on 4/6/24.
//

import SwiftUI

struct GlobalCryptoListView: View {
    
    @ObservedObject private var viewModel: GlobalCryptoListViewModel
    private let createCryptoDetailView: CreateCryptoDetailView
    
    init(viewModel: GlobalCryptoListViewModel, createCryptoDetailView: CreateCryptoDetailView) {
        self.viewModel = viewModel
        self.createCryptoDetailView = createCryptoDetailView
    }
    
    var body: some View {
        NavigationStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    viewModel.getCryptos()
                }
                .refreshable {
                    viewModel.getCryptos()
                }
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
                                    NavigationLink {
                                        createCryptoDetailView.create()
                                    } label: {
                                        CryptoListItemView(item: crypto)
                                    }
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
    GlobalCryptoListView(viewModel: .preview, createCryptoDetailView: CryptoDetailFactory())
}
