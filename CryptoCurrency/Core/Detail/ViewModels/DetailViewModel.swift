//
//  DetailViewModel.swift
//  CryptoCurrency
//
//  Created by Prithvish Shaunkani on 19/10/21.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel){
        coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("Reveived coin data")
                print(returnedCoinDetails ?? "0")
            }
            .store(in: &cancellables)
    }
}
