//
//  LinksAndDocumentationLinksAndDocumentationConfigurator.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class LinksAndDocumentationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LinksAndDocumentationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LinksAndDocumentationViewController) {

        let router = LinksAndDocumentationRouter()

        let presenter = LinksAndDocumentationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LinksAndDocumentationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
