//
//  FavoriteFavoriteInitializer.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class FavoriteModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var favoriteViewController: FavoriteViewController!

    override func awakeFromNib() {

        let configurator = FavoriteModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: favoriteViewController)
    }

}
