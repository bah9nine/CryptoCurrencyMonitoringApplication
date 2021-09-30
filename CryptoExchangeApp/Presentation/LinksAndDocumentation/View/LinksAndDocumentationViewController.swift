//
//  LinksAndDocumentationLinksAndDocumentationViewController.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit

class LinksAndDocumentationViewController: UIViewController, LinksAndDocumentationViewInput {
    var output: LinksAndDocumentationViewOutput!

    @IBOutlet weak var tableView: UITableView!
    var displayManager: LinksAndDocsDisplayManager!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: LinksAndDocumentationViewInput
    func setupInitialState() {
        displayManager = LinksAndDocsDisplayManager(tableView: tableView)
        navigationItem.title = "Ссылки и Документы"
        displayManager.delegate = self
    }
    
    func reload(_ data: [LinksAndDocs]) {
        displayManager.reloadData(data)
    }
    
    func openLinks(url: URL) {
        UIApplication.shared.open(url)
    }
}

extension LinksAndDocumentationViewController: LinksAndDocsDelegate {
    func linksAndDocs(_ linksAndDocs: LinksAndDocsDisplayManager, called action: TypeOfActionLinksAndDocs) {
        switch action {
        case .privacy:
            output.openLinks(type: .privacy)
        case .support, .terms:
            output.openLinks(type: .support)
        case .restore, .subscribe:
            output.openLinks(type: .restore)
        }
    }
}
