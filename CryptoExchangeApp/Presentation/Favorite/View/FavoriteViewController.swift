//
//  FavoriteFavoriteViewController.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, FavoriteViewInput {
    @IBOutlet weak var emptyListMassageLabel: UILabel!
    var tableView = UITableView()
    var output: FavoriteViewOutput!
    var displayManager: ListOfCurrenciesDisplayManager!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayManager = ListOfCurrenciesDisplayManager(tableView: tableView, canEdit: true)
        displayManager.delegate = self
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.getFavoriteCurrencies()
        setupTableView()
    }
    
    // MARK: FavoriteViewInput
    func setupInitialState() {
        navigationItem.title = "Избранное"
        navigationItem.backButtonTitle = ""
    }
   
    func setupTableView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func reloadData(with currency: [Currency]) {
        displayManager.reload(with: currency)
        tableView.isHidden = false
        view.addSubview(tableView)
    }
    
    func hideTableView() {
        tableView.isHidden = true
    }
}

extension FavoriteViewController: ListOfCurrenciesDisplayManagerDelegate {
    func listOfCurrenciesDisplayManager(_ listOfCurrenciesDisplayManager: ListOfCurrenciesDisplayManager, didSelected currencie: Currency) {
        output.detailedInfo(of: currencie)
    }
    
    func listOfCurrenciesDisplayManager(_ listOfCurrenciesDisplayManager: ListOfCurrenciesDisplayManager,  deleted currency: Currency) {
        output.removeFromFavorite(currency)
    }
}


