//
//  DetailedInformationDetailedInformationViewOutput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol DetailedInformationViewOutput {

    /**
        @author Ivan
        Notify presenter that view is ready
    */
    var currency: Currency! { get }
    func viewIsReady()
    func getHistoricalValue(on interval: TimeInterval)
    func showSpecificPrice(index: Int)
    func addCurrencyToFavorite()
    func removeCurrencyFromFavorite()
    var isFavorite: Bool! { get }
    func checkForFavorite() 
}
