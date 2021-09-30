//
//  ListOfCurrenciesListOfCurrenciesViewOutput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol ListOfCurrenciesViewOutput {

    /**
        @author Ivan
        Notify presenter that view is ready
    */

    func viewIsReady()
    func showDetailedInfo(currency: Currency)
    func reconnect() 
}
