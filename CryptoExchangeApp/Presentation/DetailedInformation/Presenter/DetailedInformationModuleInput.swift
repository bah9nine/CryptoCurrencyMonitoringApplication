//
//  DetailedInformationDetailedInformationModuleInput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

protocol DetailedInformationModuleInput: AnyObject, RamblerViperModuleInput {
    func showDetailed(_ currecny: Currency)
}
