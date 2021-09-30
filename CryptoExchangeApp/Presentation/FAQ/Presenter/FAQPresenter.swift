//
//  FAQFAQPresenter.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class FAQPresenter: FAQModuleInput, FAQViewOutput, FAQInteractorOutput {

    weak var view: FAQViewInput!
    var interactor: FAQInteractorInput!
    var router: FAQRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}
