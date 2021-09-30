//
//  DetailedInformationDetailedInformationInitializer.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class DetailedInformationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var detailedinformationViewController: DetailedInformationViewController!

    override func awakeFromNib() {

        let configurator = DetailedInformationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailedinformationViewController)
    }

}
