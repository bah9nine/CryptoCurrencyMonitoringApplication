//
//  ListOfCurrenciesListOfCurrenciesInteractorOutput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol ListOfCurrenciesInteractorOutput: AnyObject {
    func getData(currencies: [Currency])
    func reject(with error: Error)
}
