//
//  DetailedInformationDetailedInformationInteractorInput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol DetailedInformationInteractorInput {
    func getPreviousPrice(of currecny: Currency, interval: TimeInterval)
    func isFavorite(currency: Currency) -> Bool
    func removeCurrencyFromFavorite(_ currency: Currency)
    func addCurrencyToFavorite(_ currency: Currency)
}
