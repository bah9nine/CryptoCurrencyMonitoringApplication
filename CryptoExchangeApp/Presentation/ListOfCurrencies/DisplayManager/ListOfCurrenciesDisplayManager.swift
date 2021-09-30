//
//  ListOfCurrenciesDisplayManager.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 16.05.2021.
//

import UIKit

class ListOfCurrenciesDisplayManager: NSObject {
    private var tableView: UITableView!
    weak var delegate: ListOfCurrenciesDisplayManagerDelegate?
    var currecnciesArray: [Currency] = []
    private var canEdit: Bool
    
    init(tableView: UITableView, canEdit: Bool) {
        self.tableView = tableView
        self.canEdit = canEdit
        super.init()
        setupInitialState()
    }
    
    private func setupInitialState() {
        let nib = UINib(nibName: CurreciesCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CurreciesCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
    }
    
    func reload(with data: [Currency]) {
        currecnciesArray = data
        tableView.reloadData()
    }
}

extension ListOfCurrenciesDisplayManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currecnciesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurreciesCell.identifier) as! CurreciesCell
        let currency = currecnciesArray[indexPath.row]
        cell.fill(currency)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currency = currecnciesArray[indexPath.row]
        delegate?.listOfCurrenciesDisplayManager(self, didSelected: currency)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canEdit
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedCurrency = currecnciesArray[indexPath.row]
            currecnciesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            var indexPathArray = [IndexPath]()
            
            for row in indexPath.row..<currecnciesArray.count {
                let indexPath = IndexPath(row: row, section: 0)
                indexPathArray.append(indexPath)
            }
            tableView.reloadRows(at: indexPathArray, with: .automatic)
            delegate?.listOfCurrenciesDisplayManager(self, deleted: deletedCurrency)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Удалить"
    }
}
