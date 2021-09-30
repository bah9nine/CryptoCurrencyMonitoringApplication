//
//  DetailedInformationDetailedInformationViewInput.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Charts

protocol DetailedInformationViewInput: AnyObject, BaseViewInput {

    /**
        @author Ivan
        Setup initial state of the view
    */
    func setupInitialState()
    func show(_ currency: Currency)
    func setupNavigationBar(currency: Currency)
    func setData(_ dataSet: LineChartDataSet)
    func startActivityIndicatorOfChart()
    func stopActivityIndicatorOfChart()
    func showPreviosPrice(_ date: String, price: Double)
    func changeStateOfFavoriteButton(_ isFavorite: Bool)
    func reloadTableView(with data: Currency)
    func disableButtonStack()
    func enableButtonStack()
}
