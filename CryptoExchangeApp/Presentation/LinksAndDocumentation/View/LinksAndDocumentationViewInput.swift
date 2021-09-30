//
//  LinksAndDocumentationLinksAndDocumentationViewInput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

protocol LinksAndDocumentationViewInput: class, BaseViewInput {

    /**
        @author Ivan
        Setup initial state of the view
    */

    func setupInitialState()
    func reload(_ data: [LinksAndDocs])
    func openLinks(url: URL)
}
