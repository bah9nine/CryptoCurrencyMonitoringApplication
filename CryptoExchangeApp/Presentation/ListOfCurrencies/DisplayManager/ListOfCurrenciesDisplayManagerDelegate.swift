//
//  ListOfCurrenciesDisplayManagerDelegate.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 16.05.2021.
//

import Foundation

protocol ListOfCurrenciesDisplayManagerDelegate: AnyObject {
    func listOfCurrenciesDisplayManager(_ listOfCurrenciesDisplayManager: ListOfCurrenciesDisplayManager, didSelected currencie: Currency)
    func listOfCurrenciesDisplayManager(_ listOfCurrenciesDisplayManager: ListOfCurrenciesDisplayManager, deleted currency: Currency)
}
