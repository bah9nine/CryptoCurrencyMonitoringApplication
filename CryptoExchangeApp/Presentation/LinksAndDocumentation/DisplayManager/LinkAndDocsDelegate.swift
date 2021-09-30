//
//  LinkAndDocsDelegate.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 21.06.2021.
//

import UIKit

protocol LinksAndDocsDelegate {
    func linksAndDocs(_ linksAndDocs: LinksAndDocsDisplayManager, called action: TypeOfActionLinksAndDocs)
}
