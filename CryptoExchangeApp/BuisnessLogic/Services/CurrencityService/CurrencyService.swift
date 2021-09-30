//
//  CurrencityService.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 18.05.2021.
//

import Foundation

protocol CurrencyService {
    func getCurrency(limit: Int ,_ completionHandler: @escaping ([Currency]?, Error?) -> Void)
    var currencyArray: [Currency] { get }
}
