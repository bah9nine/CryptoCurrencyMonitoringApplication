//
//  FavoriteFavoriteConfigurator.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class FavoriteModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FavoriteViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FavoriteViewController) {

        let router = FavoriteRouter()

        let presenter = FavoritePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FavoriteInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        router.transitionHandler = viewController
    }

}
