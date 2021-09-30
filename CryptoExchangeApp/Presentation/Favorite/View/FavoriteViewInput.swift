//
//  FavoriteFavoriteViewInput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol FavoriteViewInput: class, BaseViewInput {

    /**
        @author Ivan
        Setup initial state of the view
    */

    func setupInitialState()
    func reloadData(with currency: [Currency])
    func hideTableView()
}
