//
//  FAQFAQConfigurator.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class FAQModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FAQViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FAQViewController) {

        let router = FAQRouter()

        let presenter = FAQPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FAQInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
