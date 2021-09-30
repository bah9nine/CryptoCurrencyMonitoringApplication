//
//  LinksAndDocumentationLinksAndDocumentationInteractor.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class LinksAndDocumentationInteractor: LinksAndDocumentationInteractorInput {

    weak var output: LinksAndDocumentationInteractorOutput!
    private let linksTitle: [LinksAndDocsTitle] = [LinksAndDocsTitle(title: "Поддержка", action: .support),
                          LinksAndDocsTitle(title: "Политика конфиденциальности", action: .privacy),
                          LinksAndDocsTitle(title: "Terms of service", action: .terms)]
    
    private let subsTitle: [LinksAndDocsTitle] = [LinksAndDocsTitle(title: "Подписаться", action: .subscribe),
                                                  LinksAndDocsTitle(title: "Восстановить подписку", action: .restore)]
    
    private lazy var links = LinksAndDocs(header: "Ссылки и Документы", titles: self.linksTitle)
    private lazy var subs = LinksAndDocs(header: "Подписка", titles: self.subsTitle)
    
    func getData() {
        output.reload([links, subs])
    }

}
