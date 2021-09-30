//
//  FavoriteService.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 03.06.2021.
//

import Foundation

protocol FavoriteService {
    func saveFavoriteCurrency(symbol: String) throws
    func deleteFavoriteCurrency(symbol: String) throws
    func isFavoriteCurrency(symbol: String) -> Bool
}
