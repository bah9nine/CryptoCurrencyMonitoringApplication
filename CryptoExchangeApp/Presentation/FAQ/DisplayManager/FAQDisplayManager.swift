//
//  FAQDisplayManager.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 14.06.2021.
//

import UIKit

class FAQDisplayManager: NSObject {
    private var tableView: UITableView!
    private var faqArray = FAQStore().faqArray
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        
        let nib = UINib(nibName: QuestionCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: QuestionCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
    }
    
}

extension FAQDisplayManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionCell.identifier) as! QuestionCell
        cell.fill(faq: faqArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? QuestionCell {
            tableView.beginUpdates()
            cell.toggle()
            tableView.endUpdates()
        }
    }
}
