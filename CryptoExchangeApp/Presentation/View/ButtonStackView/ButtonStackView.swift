//
//  ButtonStackView.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 06.06.2021.
//

import UIKit

class ButtonStackView: UIStackView {
    
    private var buttonArray: [UIButton] = []
    private var currentButton: UIButton?
    var selectedButtonIndex: Int?
    
    private var listener: ((UIButton) -> Void)?
    
    func setupOnClickListener(_ handler: @escaping (UIButton) -> Void) {
        self.listener = handler
    }
    
    func setupStackView(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
    }
    
    func insertButton(withTitle: String) {
        let button = SelectableButton(frame: CGRect())
        button.setTitle(withTitle, for: .normal)
        button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
        buttonArray.append(button)
        addArrangedSubview(button)
    }
    
    func deleteAll() {
        buttonArray.forEach { (button) in
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        buttonArray.removeAll()
    }
    
    @objc private func buttonDidPressed(_ sender: UIButton) {
        currentButton?.isSelected = false
        currentButton = sender
        sender.isSelected = true
        selectedButtonIndex = buttonArray.firstIndex(of: sender)
        listener?(sender)
    }
    
    func selectButton(at index: Int) {
        let button = buttonArray[index]
        button.isSelected = true
        currentButton = button
    }
    
    func disableButton() {
        currentButton?.isSelected = false
        
        buttonArray.forEach{ button in
            button.isEnabled = false
        }
    }
    
    func enableButton() {
        currentButton?.isSelected = true
        buttonArray.forEach{ button in
            button.isEnabled = true
        }
    }
}

