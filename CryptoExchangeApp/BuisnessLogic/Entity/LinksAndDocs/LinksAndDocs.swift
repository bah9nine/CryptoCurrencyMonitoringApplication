//
//  LinksAndDocs.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 21.06.2021.
//

import Foundation

struct LinksAndDocs {
    let header: String
    var arrayOfTitles: [LinksAndDocsTitle]
    
    init(header: String, titles: [LinksAndDocsTitle]) {
        self.header = header
        self.arrayOfTitles = titles
    }
    
    
    
}
