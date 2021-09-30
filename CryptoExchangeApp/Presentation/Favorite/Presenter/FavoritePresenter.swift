//
//  FavoriteFavoritePresenter.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class FavoritePresenter: FavoriteModuleInput, FavoriteViewOutput, FavoriteInteractorOutput {
    weak var view: FavoriteViewInput!
    var interactor: FavoriteInteractorInput!
    var router: FavoriteRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        getFavoriteCurrencies()
    }
    
    func getFavoriteCurrencies() {
        let currencies = interactor.getFavoriteCurrencies()
        
        if currencies.isEmpty {
            view.hideTableView()
        } else {
            view.reloadData(with: currencies)
        }
    }
    
    func detailedInfo(of currency: Currency) {
        router.openDetailedInfo(currency)
    }
    
    func reject(with error: Error) {
        view.show(error)
    }
    
    func removeFromFavorite(_ currency: Currency) {
        interactor.removeCurrencyFromFavorite(currency)
        getFavoriteCurrencies()
    }
}
