//
//  SearchManager.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 22.05.2021.
//

import UIKit

class SearchManager: NSObject {
    var searchController: UISearchController!
    var delegate: SearchManagerDelegate?
    
    var currenciesArray: [Currency] = []
    
    init(searchController: UISearchController) {
        self.searchController = searchController
        super.init()
        setupInitialState()
    }
    
    private func setupInitialState() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Поиск"
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    func setCurrencyArray(currencies: [Currency]) {
        currenciesArray = currencies
    }
    
    private func filtredBySearchText(_ text: String) -> [Currency] {
        return currenciesArray.filter({ (currency) -> Bool in
            let nameOverlap: Bool = currency.name.lowercased().contains(text.lowercased())
            let symbolOverlap: Bool = currency.symbol.lowercased().contains(text.lowercased())
            return nameOverlap || symbolOverlap
        })
    }
}

extension SearchManager: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 0 {
            let filtredCurrenciesArray = filtredBySearchText(text)
            delegate?.searchManager(self, updateResult: filtredCurrenciesArray)
        } else {
            delegate?.searchManager(self, updateResult: currenciesArray)
        }
    }
}
