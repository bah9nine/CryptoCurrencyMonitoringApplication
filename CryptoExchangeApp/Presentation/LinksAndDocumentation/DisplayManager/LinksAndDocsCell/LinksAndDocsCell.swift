//
//  LinksAndDocsCell.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 17.06.2021.
//

import UIKit

class LinksAndDocsCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        arrowImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi  * 1.5)
    }
    
    func fill(_ title: String) {
        nameLabel.text = title
    }
}
