//
//  SelectableButton.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 04.06.2021.
//

import UIKit

class SelectableButton: RoundedButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        tintColor = .clear
        setTitleColor(.blue, for: .normal)
        setTitleColor(.white, for: .selected)
        
        setBackgroundColor(.blue, for: .selected)
        setBackgroundColor(.clear, for: .normal)
    }
}
