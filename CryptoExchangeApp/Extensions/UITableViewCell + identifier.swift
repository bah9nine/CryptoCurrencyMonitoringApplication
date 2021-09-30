//
//  UITableViewCell + id.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 14.06.2021.
//

import UIKit


extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
