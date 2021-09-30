//
//  PreviousPriceOfCurrency.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 30.05.2021.
//

import Foundation
import ObjectMapper

struct CrypthoCurrencyPrice: ImmutableMappable {
    let time: Double
    let closePrice: Double
    
    init(map: Map) throws {
        time = try map.value("time")
        closePrice = try map.value("close")
    }
}
