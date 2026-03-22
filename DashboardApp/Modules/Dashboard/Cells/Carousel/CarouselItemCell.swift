//
//  CarouselItemCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class CarouselItemCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        cardView.layer.cornerRadius = 20
        cardView.clipsToBounds = true
    }

    func configure(item: CarouselItem) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        iconImageView.image = UIImage(named: item.icon)

        applyGradient()
    }

    private func applyGradient() {

        cardView.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })

        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(red: 0.60, green: 0.80, blue: 0.95, alpha: 1).cgColor,
            UIColor(red: 0.60, green: 0.90, blue: 0.70, alpha: 1).cgColor
        ]

        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = cardView.bounds
        gradient.cornerRadius = 20

        cardView.layer.insertSublayer(gradient, at: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cardView.layer.sublayers?.first?.frame = cardView.bounds
    }
}
