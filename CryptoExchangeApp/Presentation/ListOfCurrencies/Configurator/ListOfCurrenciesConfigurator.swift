//
//  ListOfCurrenciesListOfCurrenciesConfigurator.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class ListOfCurrenciesModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ListOfCurrenciesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ListOfCurrenciesViewController) {

        let router = ListOfCurrenciesRouter()

        let presenter = ListOfCurrenciesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListOfCurrenciesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        let currencyService = CurrencyServiceImp.shared
        interactor.currencyService = currencyService
        
        router.transitionHandler = viewController
    }

}
