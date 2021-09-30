//
//  DetailedInformationDetailedInformationInteractor.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

class DetailedInformationInteractor: DetailedInformationInteractorInput {
    weak var output: DetailedInformationInteractorOutput!
    var chartService = ChartServiceImp.shared
    var favoriteService = FavoriteServiceImp.shared
    
    func getPreviousPrice(of currecny: Currency, interval: TimeInterval) {
        chartService.getPreviousValue(symbol: currecny.symbol, intervalType: interval) { (data, error) in
            if let data = data {
                if interval == .all || interval == .oneWeak {
                    let shortenArray = self.shortenArray(data: data)
                    self.output.getPreviousPrice(data: shortenArray)
                } else {
                    self.output.getPreviousPrice(data: data)
                }
            }
            if let error = error {
                self.output.reject(with: error)
            }
        }
    }
    
    func isFavorite(currency: Currency) -> Bool {
        return favoriteService.isFavoriteCurrency(symbol: currency.symbol)
    }
    
    func removeCurrencyFromFavorite(_ currency: Currency) {
        do {
            try favoriteService.deleteFavoriteCurrency(symbol: currency.symbol)
        } catch {
            output.reject(with: error)
        }
        
    }
    
    func addCurrencyToFavorite(_ currency: Currency) {
        do {
           try  favoriteService.saveFavoriteCurrency(symbol: currency.symbol)
        } catch {
            output.reject(with: error)
        }
    }
    
    func shortenArray(data: [CrypthoCurrencyPrice]) -> [CrypthoCurrencyPrice] {
        var temp: [CrypthoCurrencyPrice] = []
        temp = data.enumerated().compactMap { index, element in
            index % 2 == 0 ? nil : element
        }
        return temp
    }
}
