//
//  LinksAndDocsTitle.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 21.06.2021.
//

import Foundation

struct LinksAndDocsTitle {
    let title: String
    let actionId: TypeOfActionLinksAndDocs?
    
    init(title: String, action: TypeOfActionLinksAndDocs?) {
        self.title = title
        self.actionId = action
    }
}
