//
//  ReconnectButtonDelegate.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 27.06.2021.
//

import UIKit

protocol ReconnectButtonDelegate: AnyObject {
    func reconnectButtonDelegate(reconnectButton: ReconnectButtonManager, didPressed button: UIButton)
}
