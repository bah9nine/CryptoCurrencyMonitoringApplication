//
//  DetailedInformationDetailedInformationConfigurator.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class DetailedInformationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DetailedInformationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DetailedInformationViewController) {

        let router = DetailedInformationRouter()

        let presenter = DetailedInformationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailedInformationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}
