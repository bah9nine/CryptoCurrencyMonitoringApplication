//
//  FavoriteFavoriteViewOutput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol FavoriteViewOutput {

    /**
        @author Ivan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func getFavoriteCurrencies()
    func detailedInfo(of currency: Currency)
    func removeFromFavorite(_ currency: Currency)
}
