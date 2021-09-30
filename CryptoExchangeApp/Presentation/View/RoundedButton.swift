//
//  RoundedButton.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 31.05.2021.
//

import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
