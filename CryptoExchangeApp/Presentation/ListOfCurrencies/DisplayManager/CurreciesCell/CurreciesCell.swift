//
//  CurreciesCell.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 16.05.2021.
//

import UIKit
import Kingfisher

class CurreciesCell: UITableViewCell {    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func fill(_ currency: Currency ) {
        
        symbolLabel.text = currency.symbol
        nameLabel.text = currency.name
        priceLabel.text = currency.price.description
        icon.kf.setImage(with: currency.urlImage)
        
        let priceChanged = currency.priceChanged
        setupPriceChangedLabel(price: priceChanged)
    }
    
    private func setupPriceChangedLabel(price: Double) {
        let currencyPrice = (price * 100)/100
        priceChangeLabel.textColor = currencyPrice < 0 ? .red : #colorLiteral(red: 0, green: 0.4453628063, blue: 0, alpha: 1)
        let lessOrMoreThenZero = currencyPrice > 0 ? "+" : ""
        priceChangeLabel.text = "\(lessOrMoreThenZero)" + price.description + " %"
    }
}
