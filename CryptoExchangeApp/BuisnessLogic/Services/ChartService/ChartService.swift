//
//  ChartService.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 29.05.2021.
//

import Foundation

protocol ChartSevice {
    func getPreviousValue(symbol: String, intervalType: TimeInterval,
                         _ completionHandler: @escaping ([CrypthoCurrencyPrice]?, Error?) -> Void)
}
