//
//  SearchManagerDelegate.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 22.05.2021.
//

import Foundation

protocol SearchManagerDelegate {
    func searchManager(_ searchManager: SearchManager, updateResult: [Currency])
}
