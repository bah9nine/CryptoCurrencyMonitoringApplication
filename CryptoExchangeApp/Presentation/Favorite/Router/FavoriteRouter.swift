//
//  FavoriteFavoriteRouter.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

class FavoriteRouter: FavoriteRouterInput {

    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol?
    
    func openDetailedInfo(_ currecny: Currency) {
        let promisse = transitionHandler?.openModule?(usingSegue: "favoriteSegue")
        promisse?.thenChain({ (moduleInput) -> RamblerViperModuleOutput? in
            (moduleInput as? DetailedInformationModuleInput)?.showDetailed(currecny)
            return nil
        })
    }
}
