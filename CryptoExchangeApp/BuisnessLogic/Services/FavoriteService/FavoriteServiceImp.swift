//
//  FavoriteServiceImp.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 03.06.2021.
//

import UIKit
import CoreData

class FavoriteServiceImp: FavoriteService {
    static let shared = FavoriteServiceImp()
    private var context: NSManagedObjectContext!
    var favoriteCurrencyArray: [FavoriteCurrency] = []
    
    private init() {
        context = getContext()
        favoriteCurrencyArray = getFavoriteCurrencies()
    }
 
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    private func getFavoriteCurrencies() -> [FavoriteCurrency] {
        do {
            if let currencies = try context.fetch(FavoriteCurrency.fetchRequest()) as? [FavoriteCurrency] {
                return currencies
            }
        } catch {
            print(SystemError.rejectWithCoreDataError)
        }
        return []
    }
    
    
    func saveFavoriteCurrency(symbol: String) throws {
        let currency = FavoriteCurrency(context: context)
        currency.symbol = symbol
        favoriteCurrencyArray.append(currency)
        
        try context.save()
    }
    
    func deleteFavoriteCurrency(symbol: String) throws {
        favoriteCurrencyArray.forEach { currecy in
            if currecy.symbol == symbol {
                context.delete(currecy)
            }
        }
            
        try context.save()
    }
    
    func isFavoriteCurrency(symbol: String) -> Bool {
        return favoriteCurrencyArray.contains { (currency) -> Bool in
            return currency.symbol == symbol
        }
    }
}
