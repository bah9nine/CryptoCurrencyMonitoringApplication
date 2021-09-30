//
//  DetailedInformationDetailedInformationPresenter.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation
import Charts

class DetailedInformationPresenter: NSObject, DetailedInformationModuleInput, DetailedInformationViewOutput, DetailedInformationInteractorOutput {
    weak var view: DetailedInformationViewInput!
    var interactor: DetailedInformationInteractorInput!
    var router: DetailedInformationRouterInput!
    var currency: Currency!
    var priceArray: [CrypthoCurrencyPrice] = []
    var isFavorite: Bool!

    func viewIsReady() {
        view.setupInitialState()
        view.show(currency)
        view.setupNavigationBar(currency: currency)
        getHistoricalValue(on: .oneDay)
        checkForFavorite()
        view.reloadTableView(with: currency)
    }
    
    func checkForFavorite() {
        isFavorite = interactor.isFavorite(currency: currency)
        view.changeStateOfFavoriteButton(isFavorite)
    }
    
    func showDetailed(_ currecny: Currency) {
        self.currency = currecny
    }
    
    func getPreviousPrice(data: [CrypthoCurrencyPrice]) {
        let dataSet = fromDataToChart(data: data)
        priceArray = data
        view.setData(dataSet)
        view.enableButtonStack()
    }
    
    func reject(with error: Error) {
        view.show(error)
    }
    
    func fromDataToChart(data: [CrypthoCurrencyPrice]) -> LineChartDataSet {
        let temp = data.enumerated().map { (index, price) -> ChartDataEntry in
            let cost = price.closePrice
            let day = Double(index)
            return ChartDataEntry(x: day, y: cost)
        }
        return LineChartDataSet(entries: temp, label: nil)
    }
    
    func getHistoricalValue(on interval: TimeInterval) {
        view.startActivityIndicatorOfChart()
        interactor.getPreviousPrice(of: currency, interval: interval)
        view.disableButtonStack()
    }
    
    func showSpecificPrice(index: Int) {
        let value = priceArray[index]
        let date = dateFormatter(unix: value.time)
        let price = value.closePrice
        view.showPreviosPrice(date, price: price)
    }
    
    func dateFormatter(unix: Double) -> String {
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSince1970: unix)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy HH:mm a")
        let dateToString = dateFormatter.string(from: date)
        return dateToString
    }
    
    func addCurrencyToFavorite() {
        isFavorite = true
        interactor.addCurrencyToFavorite(currency)
        view.changeStateOfFavoriteButton(isFavorite)
        view.popUpAlert(with: "\(currency.symbol) добавлен в избранное")
    }
    
    func removeCurrencyFromFavorite() {
        isFavorite = false
        interactor.removeCurrencyFromFavorite(currency)
        view.changeStateOfFavoriteButton(isFavorite)
        view.popUpAlert(with: "\(currency.symbol) удален из избранного")
    }
}
