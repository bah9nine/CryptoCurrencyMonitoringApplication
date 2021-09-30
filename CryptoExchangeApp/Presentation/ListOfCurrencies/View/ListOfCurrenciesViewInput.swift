//
//  ListOfCurrenciesListOfCurrenciesViewInput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol ListOfCurrenciesViewInput: AnyObject, BaseViewInput {

    /**
        @author Ivan
        Setup initial state of the view
    */
    func setCurrencyArrayInSearchManager(data: [Currency])
    func setupInitialState()
    func reload(with data: [Currency])
    func startDownloading()
    func showTablewView()
    func showReconnectButton()
    func hideReconnectButton()
}
