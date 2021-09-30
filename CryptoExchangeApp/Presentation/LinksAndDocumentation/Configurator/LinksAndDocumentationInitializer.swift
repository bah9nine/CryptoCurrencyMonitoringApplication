//
//  LinksAndDocumentationLinksAndDocumentationInitializer.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class LinksAndDocumentationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var linksanddocumentationViewController: LinksAndDocumentationViewController!

    override func awakeFromNib() {

        let configurator = LinksAndDocumentationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: linksanddocumentationViewController)
    }

}
