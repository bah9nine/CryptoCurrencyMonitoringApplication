//
//  QuestionCell.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 13.06.2021.
//

import UIKit

class QuestionCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var rightSeporatorVIew: UIView!
    @IBOutlet weak var leftSeporatorView: UIView!
    private var heightConstraint: NSLayoutConstraint?
    private let highPriority = UILayoutPriority(999)
    private let lowPriority = UILayoutPriority(1)
    private var state: IsRolled?
    var didGradientLayout: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        state = .rolledUp
        answerLabel.numberOfLines = 2
        selectionStyle = .none
        arrowImage.tintColor = UIColor.lightGray.withAlphaComponent(0.7)
        setupConstraint()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        if !didGradientLayout {
            setup(seporator: rightSeporatorVIew, to: .right)
            setup(seporator: leftSeporatorView, to: .left)
            didGradientLayout = true
        }
    }
    
    func setupConstraint() {
        let labelWidth = answerLabel.frame.width
        let font = UIFont.systemFont(ofSize: 18)
        guard let heightOfOneLine = answerLabel.text?.height(withConstrainedWidth: labelWidth, font: font) else {
            return
        }
        
        let constantHeight = heightOfOneLine * CGFloat(answerLabel.numberOfLines)
        heightConstraint = answerLabel.heightAnchor.constraint(equalToConstant: constantHeight)
        heightConstraint?.isActive = true
        heightConstraint?.priority = highPriority
    }
    
    func toggle() {
        switch state {
        case .rolledUp:
            heightConstraint?.priority = lowPriority
            answerLabel.numberOfLines = 0
            rotateArrow(direction: .up)
            state = .deployed
        case .deployed:
            heightConstraint?.priority = highPriority
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.answerLabel.numberOfLines = 2
            }
            rotateArrow(direction: .down)
            state = .rolledUp
        default:
            break
        }
    }
    
    func fill(faq: Question) {
        questionLabel.text = faq.question
        answerLabel.text = faq.answer
    }
    
    private func setup(seporator: UIView, to side: Sides) {
        let gradient = CAGradientLayer()
        
        switch side {
        case .left:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .right:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        gradient.frame = seporator.bounds
        let topColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        let botColor = UIColor.white.cgColor
        gradient.colors = [topColor, botColor]
        seporator.layer.insertSublayer(gradient, at: 0)
    }
    
    func rotateArrow(direction: RotateDirection) {
        var angle: CGFloat
        switch direction {
        case .down:
            angle = sin(CGFloat.pi)
        case .up:
            angle = CGFloat.pi
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.4, options: [.curveLinear]) {
            self.arrowImage.transform = CGAffineTransform(rotationAngle: angle)
        }
    }
}

private enum Sides {
    case left
    case right
}

private enum IsRolled {
    case rolledUp
    case deployed
}
