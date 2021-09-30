//
//  FavoriteFavoriteInteractor.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class FavoriteInteractor: FavoriteInteractorInput {

    weak var output: FavoriteInteractorOutput!
    var favoriteService = FavoriteServiceImp.shared
    var currencyService = CurrencyServiceImp.shared
    
    func getFavoriteCurrencies() -> [Currency] {
        let currencyArray = currencyService.currencyArray
        let favoriteCurrencies = favoriteService.favoriteCurrencyArray
        var temp: [Currency] = []
        
        for favorite in 0..<favoriteCurrencies.count {
            for currency in 0..<currencyArray.count {
                if favoriteCurrencies[favorite].symbol == currencyArray[currency].symbol {
                    temp.append(currencyArray[currency])
                }
            }
        }
        return temp
    }
    
    func removeCurrencyFromFavorite(_ currency: Currency) {
        do {
            try favoriteService.deleteFavoriteCurrency(symbol: currency.symbol)
        } catch {
            output.reject(with: error)
        }
    }
    
}
