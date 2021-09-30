//
//  ListOfCurrenciesListOfCurrenciesInitializer.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class ListOfCurrenciesModuleInitializer: NSObject {
    //Connect with object on storyboard
    @IBOutlet weak var listofcurrenciesViewController: ListOfCurrenciesViewController!

    override func awakeFromNib() {

        let configurator = ListOfCurrenciesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: listofcurrenciesViewController)
    }

}
