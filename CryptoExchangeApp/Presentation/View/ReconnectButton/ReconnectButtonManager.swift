//
//  reconnectButton.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 27.06.2021.
//

import UIKit

class ReconnectButtonManager {
    var view: UIView!
    weak var delegate: ReconnectButtonDelegate?
    let button = UIButton()
    
    init(view: UIView) {
        self.view = view
    }

    private func prepareToShow() {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("Reconnect", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
        
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 250).isActive = true
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func buttonDidPressed(sender: UIButton) {
        delegate?.reconnectButtonDelegate(reconnectButton: self, didPressed: sender)
    }
    
    func showButton() {
        prepareToShow()
    }
    
    func hideButton() {
        button.removeFromSuperview()
    }
}
