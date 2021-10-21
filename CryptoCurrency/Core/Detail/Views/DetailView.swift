//
//  DetailView.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 19/10/21.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}


struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    
    @State private var showFullDescription: Bool = false
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Initailising detail view for \(coin.name)")
    }
    
    var body: some View {
        ScrollView {
            VStack() {
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                VStack(spacing: 20) {
                    overviewTitle
                    Divider()
                    
                    if let coinDescription = vm.description, !coinDescription.isEmpty {
                        VStack(alignment: .leading) {
                            Text(coinDescription)
                                .lineLimit(showFullDescription ? nil : 3)
                                .font(.callout)
                                .foregroundColor(.theme.secondaryText)
                            
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    showFullDescription.toggle()
                                }
                            }, label: {
                                Text(showFullDescription ? "Less" : "Read More")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 4)
                            })
                                .accentColor(.blue)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    overviewGrid
                    additionalTitle
                    Divider()
                    additionalGrid
                    
                    VStack(alignment: .leading, spacing: 10) {
                        if let websiteURL = vm.websiteURL,
                           let url = URL(string: websiteURL) {
                            Link("Website", destination: url)
                        }
                        
                        if let redditURL = vm.redditURL,
                           let url = URL(string: redditURL) {
                            Link("Reddit", destination: url)
                        }
                    }
                    .accentColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                }
                .padding()
            }
                
        }
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}



extension DetailView {
    
    private var navigationBarTrailingItems: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
            .foregroundColor(.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, pinnedViews: []) {
            ForEach(vm.overviewStatistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, pinnedViews: []) {
            ForEach(vm.additonalStatistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
}
