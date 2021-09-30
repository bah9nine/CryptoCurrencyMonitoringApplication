//
//  BaseView.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 22.05.2021.
//

import UIKit

protocol BaseViewInput {
    func show(_ error: Error)
    func showAlert(titel: String?, massage: String?)
}

extension BaseViewInput {
    func showAlert(titel: String?, massage: String?) {
        guard let vc = self as? UIViewController else { return }
        let alert = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let action = UIAlertAction(title: titel, style: .default)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
    func show(_ error: Error) {
        showAlert(titel: "Ok", massage: error.localizedDescription)
    }
}

extension BaseViewInput {
    func popUpAlert(with title: String) {
        guard let vc = self as? UIViewController else { return }
        let alert = PopUpAlert(view: vc.view)
        alert.showAlert(with: title)
    }
}
