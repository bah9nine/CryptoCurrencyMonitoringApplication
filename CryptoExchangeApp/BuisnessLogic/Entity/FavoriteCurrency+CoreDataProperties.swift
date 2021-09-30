//
//  FavoriteCurrency+CoreDataProperties.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 03.06.2021.
//
//

import Foundation
import CoreData


extension FavoriteCurrency {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteCurrency> {
        return NSFetchRequest<FavoriteCurrency>(entityName: "FavoriteCurrency")
    }

    @NSManaged public var symbol: String?

}

extension FavoriteCurrency : Identifiable {

}
