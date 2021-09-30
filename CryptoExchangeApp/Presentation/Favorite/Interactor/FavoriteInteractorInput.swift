//
//  FavoriteFavoriteInteractorInput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol FavoriteInteractorInput {
    
    func getFavoriteCurrencies() -> [Currency]
    func removeCurrencyFromFavorite(_ currency: Currency)
}
