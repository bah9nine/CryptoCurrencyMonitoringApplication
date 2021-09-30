//
//  DetailedInfoDisplayManager.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 11.06.2021.
//

import UIKit

class DetailedInfoDisplayManager: NSObject {
    private let tableView: UITableView!
    private var detailedInfo: DetailedInfo?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupInitialState()
    }
    
    private func setupInitialState() {
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: InfoCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: InfoCell.identifier)
        tableView.rowHeight = 50
    }
    
    func fillDataOf(currency: Currency) {
        self.detailedInfo = DetailedInfo(currency: currency)
    }
}

extension DetailedInfoDisplayManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailedInfo?.detailedInfo.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier) as! InfoCell
        
        guard  let infoData = detailedInfo?.detailedInfo[indexPath.row] else {
            return cell
        }

        let description = infoData.key
        let value = infoData.value
        cell.fill(info: description, value: value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
