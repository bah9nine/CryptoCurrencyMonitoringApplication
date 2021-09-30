//
//  FavoriteAlert.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 14.06.2021.
//

import UIKit

class PopUpAlert {
    private var view: UIView
    private let alert = UIView()
    private let label = UILabel()
    
    init(view: UIView) {
        self.view = view
        setupAlert()
    }

    private func setupAlert() {
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        alert.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: alert.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: alert.centerXAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: alert.leadingAnchor, constant: 15).isActive = true
        label.topAnchor.constraint(equalTo: alert.topAnchor, constant: 8).isActive = true
        
        alert.layer.cornerRadius = 10
        alert.backgroundColor = .black.withAlphaComponent(1)

        view.addSubview(alert)
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: alert.bottomAnchor, constant: 125).isActive = true
    }
    
    func showAlert(with massage: String) {
        label.text = massage
        view.addSubview(alert)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.alert.removeFromSuperview()
        }
    }
}
