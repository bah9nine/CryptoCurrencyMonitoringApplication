//
//  ListOfCurrenciesListOfCurrenciesPresenter.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

class ListOfCurrenciesPresenter: ListOfCurrenciesModuleInput, ListOfCurrenciesViewOutput, ListOfCurrenciesInteractorOutput {

    weak var view: ListOfCurrenciesViewInput!
    var interactor: ListOfCurrenciesInteractorInput!
    var router: ListOfCurrenciesRouterInput!
    let maxItemsCount: Int = 30

    func viewIsReady() {
        view.setupInitialState()
        interactor.getCurrencies(limit: maxItemsCount)
        view.startDownloading()
    }
    
    func getData(currencies: [Currency]) {
        view.reload(with: currencies)
        view.setCurrencyArrayInSearchManager(data: currencies)
        view.showTablewView()
    }
    
    func showDetailedInfo(currency: Currency) {
        router.openDetailedInfo(currency)
    }
    
    func reject(with error: Error) {
        view.showReconnectButton()
        view.show(error)
    }
    
    func reconnect() {
        interactor.getCurrencies(limit: maxItemsCount)
        view.startDownloading()
        view.hideReconnectButton()
    }
}
