//
//  LinksAndDocumentationLinksAndDocumentationPresenter.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class LinksAndDocumentationPresenter: LinksAndDocumentationModuleInput, LinksAndDocumentationViewOutput, LinksAndDocumentationInteractorOutput {

    weak var view: LinksAndDocumentationViewInput!
    var interactor: LinksAndDocumentationInteractorInput!
    var router: LinksAndDocumentationRouterInput!
    private let privacyUrl = URL(string: "https://www.apple.com/ru/privacy/")
    private let supportUrl = URL(string: "https://google.com")

    func viewIsReady() {
        view.setupInitialState()
        interactor.getData()
    }
    
    func reload(_ data: [LinksAndDocs]) {
        view.reload(data)
    }
    
    func openLinks(type: TypeOfActionLinksAndDocs) {
        switch type {
        case .privacy:
            guard let url = privacyUrl else {
                return
            }
            view.openLinks(url: url)
        case .support, .terms:
            guard let url = supportUrl else {
                return
            }
            view.openLinks(url: url)
        case .restore, .subscribe:
            view.showAlert(titel: "Ok", massage: "Not yet implemented")
        }
    }
}
