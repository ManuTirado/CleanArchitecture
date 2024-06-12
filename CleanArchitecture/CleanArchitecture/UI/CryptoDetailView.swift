//
//  CryptoDetailView.swift
//  CleanArchitecture
//
//  Created by manueltirado on 12/6/24.
//

import SwiftUI
import Charts

struct ChartDataPoint: Identifiable {
    let id = UUID()
    let date: Date
    let price: Double
}

struct CryptoDetailView: View {
    @ObservedObject private var viewModel: CryptoDetailViewModel
    
    init(viewModel: CryptoDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        content
            .onAppear {
                viewModel.getDetail()
            }
    }
    
    @ViewBuilder
    var content: some View {
        ZStack {
            VStack {
                CryptoDetailHeaderView()
                
                Chart(viewModel.dataPoints) {
                    LineMark(x: .value("Date", $0.date),
                             y: .value("Price", $0.price))
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        
    }
}

#Preview {
    CryptoDetailView(viewModel: .preview)
}
