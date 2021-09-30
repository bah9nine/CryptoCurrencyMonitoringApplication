//
//  UIButton+setBackgroundColor.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 04.06.2021.
//

import UIKit

extension UIButton {
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        clipsToBounds = true
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            let rect = CGRect(origin: .zero, size: size)
            context.fill(rect)
            let pixelImage = UIGraphicsGetImageFromCurrentImageContext()
            setBackgroundImage(pixelImage, for: state)
        }
        UIGraphicsEndImageContext()
    }
    
}
