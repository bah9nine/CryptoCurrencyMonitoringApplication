//
//  FAQFAQViewController.swift
//  CryptoExchangeApp
//
//  Created by Ivan on 16/05/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import UIKit
import SwiftEntryKit

class FAQViewController: UIViewController, FAQViewInput {

    @IBOutlet weak var tableView: UITableView!
    var output: FAQViewOutput!
    var displayManager: FAQDisplayManager!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayManager = FAQDisplayManager(tableView: tableView)
        output.viewIsReady()
    }

    
    // MARK: FAQViewInput
    func setupInitialState() {
        navigationItem.title = "Вопросы и ответы"
        
    }
}

