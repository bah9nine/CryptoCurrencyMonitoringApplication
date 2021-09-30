//
//  infoCell.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 23.05.2021.
//

import UIKit

class InfoCell: UITableViewCell {
    @IBOutlet weak var coinInfoLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func fill(info: String, value: NSAttributedString) {
        coinInfoLabel.text = info
        valueLabel.attributedText = value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.textColor = .black
    }
}
