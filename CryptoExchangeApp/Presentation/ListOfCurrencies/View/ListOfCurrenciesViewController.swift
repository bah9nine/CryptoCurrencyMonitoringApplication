//
//  ListOfCurrenciesListOfCurrenciesViewController.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class ListOfCurrenciesViewController: UIViewController, ListOfCurrenciesViewInput {
    @IBOutlet weak var tableView: UITableView!
    var output: ListOfCurrenciesViewOutput!
    var displayManager: ListOfCurrenciesDisplayManager?
    var searchController = UISearchController()
    var searchManager: SearchManager!
    var emptyListNotificationLabel = UILabel()
    var reconnectButton: ReconnectButtonManager?
    var activityIndicatorView: ActivityIndicatorView?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: ListOfCurrenciesViewInput
    func setupInitialState() {
        navigationItem.title = "Список криптовалют"
        navigationItem.searchController = searchController
        navigationItem.backButtonTitle = ""
        
        displayManager = CryptoExchangeApp.ListOfCurrenciesDisplayManager(tableView: tableView, canEdit: false)
        displayManager?.delegate = self
        searchManager = SearchManager(searchController: searchController)
        searchManager.delegate = self
        activityIndicatorView = ActivityIndicatorView(view: self.view)
        reconnectButton = ReconnectButtonManager(view: self.view)
        reconnectButton?.delegate = self
        setupNotificationView()
    }
    
    func startDownloading() {
        tableView.isHidden = true
        activityIndicatorView?.showActivityIndicator()
    }
    
    func showTablewView() {
        tableView.isHidden = false
        activityIndicatorView?.hideActivityIndicator()
        searchController.searchBar.isHidden = false
    }
    
    func showReconnectButton() {
        reconnectButton?.showButton()
        activityIndicatorView?.hideActivityIndicator()
        searchController.searchBar.isHidden = true
    }
    
    func hideReconnectButton() {
        reconnectButton?.hideButton()
    }

    func reload(with data: [Currency]) {
        displayManager?.reload(with: data)
    }
    
    func setCurrencyArrayInSearchManager(data: [Currency]) {
        searchManager.setCurrencyArray(currencies: data)
    }
    
    func showNotification(isEmpty: Bool) {
        tableView.isHidden = isEmpty
        emptyListNotificationLabel.isHidden = !isEmpty        
    }
    
    func setupNotificationView() {
        emptyListNotificationLabel.text = "Список пуст"
        emptyListNotificationLabel.font = UIFont.systemFont(ofSize: 16)
        let xCenter = view.frame.width / 2 - 50
        let yCenter = view.frame.height / 2 - 100
        let frame = CGRect(x: xCenter, y: yCenter, width: 200, height: 200)
        emptyListNotificationLabel.frame = frame
        self.view.addSubview(emptyListNotificationLabel)
        emptyListNotificationLabel.isHidden = true
    }
    
}

extension ListOfCurrenciesViewController: ListOfCurrenciesDisplayManagerDelegate {
    
    func listOfCurrenciesDisplayManager(_ listOfCurrenciesDisplayManager: ListOfCurrenciesDisplayManager,
                                        didSelected currencie: Currency) {
        output.showDetailedInfo(currency: currencie)
    }
    
    func listOfCurrenciesDisplayManager(_ listOfCurrenciesDisplayManager: ListOfCurrenciesDisplayManager,  deleted currencie: Currency) {
    }
}

extension ListOfCurrenciesViewController: SearchManagerDelegate {
    func searchManager(_ searchManager: SearchManager, updateResult: [Currency]) {
        let isEmpty = updateResult.isEmpty
        reload(with: updateResult)
        showNotification(isEmpty: isEmpty)
    }
}

extension ListOfCurrenciesViewController: ReconnectButtonDelegate {
    func reconnectButtonDelegate(reconnectButton: ReconnectButtonManager, didPressed button: UIButton) {
        output.reconnect()
    }
}
