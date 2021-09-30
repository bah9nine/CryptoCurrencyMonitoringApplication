//
//  LinksAndDocsDisplayManager.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 17.06.2021.
//

import UIKit

class LinksAndDocsDisplayManager: NSObject {
    var tableView: UITableView!
        
    var links: [LinksAndDocs] = []
    var delegate: LinksAndDocsDelegate?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    func setupTableView() {
        let nib = UINib(nibName: LinksAndDocsCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LinksAndDocsCell.identifier)
        tableView.rowHeight = 60
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func reloadData(_ data: [LinksAndDocs]) {
        links += data
    }
}

extension LinksAndDocsDisplayManager: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return links.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = links[section].arrayOfTitles.count
        return rows
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header = links[section].header
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LinksAndDocsCell.identifier) as! LinksAndDocsCell
        let object = links[indexPath.section]
        let title = object.arrayOfTitles[indexPath.row].title
        cell.fill(title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let action = links[indexPath.section].arrayOfTitles[indexPath.row].actionId else { return }
        delegate?.linksAndDocs(self, called: action)
    }
}
