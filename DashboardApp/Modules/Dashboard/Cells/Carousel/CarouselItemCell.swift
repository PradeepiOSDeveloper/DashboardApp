//
//  CarouselItemCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class CarouselItemCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        cardView.layer.cornerRadius = 16

        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemBlue.withAlphaComponent(0.5).cgColor,
            UIColor.systemGreen.withAlphaComponent(0.5).cgColor
        ]
        gradient.frame = cardView.bounds
        gradient.cornerRadius = 16

        cardView.layer.insertSublayer(gradient, at: 0)
    }
}
