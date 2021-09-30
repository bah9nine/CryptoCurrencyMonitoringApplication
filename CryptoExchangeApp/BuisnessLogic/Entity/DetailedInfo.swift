//
//  DetailedInfo.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 24.05.2021.
//

import Foundation
import UIKit

struct DetailedInfo {
    
    var detailedInfo: [(key: String, value: NSAttributedString)]
    
    init(currency: Currency) {
        let priceChanged = DetailedInfo.setupPriceChangedRow(currency: currency.priceChanged)
       
        self.detailedInfo = [
            ("Капитализация", NSAttributedString(string: currency.capitalization)),
            ("Изменения (за 24 ч.)", priceChanged),
            ("Предложения", NSAttributedString(string: currency.supply)),
            ("Объем (за 24 ч.)", NSAttributedString(string: currency.volumePerDay)),
            ("Алгоритм подтверждения", NSAttributedString(string: currency.proofType)),
            ("Алгоритм хеширования", NSAttributedString(string: currency.algorithm))
        ]
    }
    
    private static func setupPriceChangedRow(currency: Double) -> NSMutableAttributedString {
        let lessOrMoreThenZero = currency > 0 ? "+" : ""
        let currencyPriceChanged = "\(lessOrMoreThenZero)\(currency.description)"
        let range = NSRange(location: 0, length: currencyPriceChanged.count)
       
        let priceChange = NSMutableAttributedString(string: currencyPriceChanged)
        let color: UIColor = currency < 0 ? .red : #colorLiteral(red: 0, green: 0.4453628063, blue: 0, alpha: 1)
        priceChange.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        return priceChange
    }
}
