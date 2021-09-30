//
//  ListOfCurrenciesListOfCurrenciesInteractor.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class ListOfCurrenciesInteractor: ListOfCurrenciesInteractorInput {
    weak var output: ListOfCurrenciesInteractorOutput!
    var currencyService: CurrencyService!
    
    func getCurrencies(limit: Int) {
        currencyService.getCurrency(limit: limit) { (currencies, error) in
            if let currencies = currencies {
                self.output.getData(currencies: currencies)
            }
            if let error = error {
                self.output.reject(with: error)
            }
        }
    }
}
