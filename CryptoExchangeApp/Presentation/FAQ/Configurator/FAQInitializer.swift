//
//  FAQFAQInitializer.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class FAQModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var faqViewController: FAQViewController!

    override func awakeFromNib() {

        let configurator = FAQModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: faqViewController)
    }

}
