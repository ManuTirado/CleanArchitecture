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
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.cryptos, id: \.id) { crypto in
                        Text(crypto.name)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

//#Preview {
//    GlobalCryptoListView()
//}
