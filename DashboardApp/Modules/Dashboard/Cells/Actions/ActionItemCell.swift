//
//  ActionItemCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class ActionItemCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        cardView.layer.cornerRadius = 40
        cardView.backgroundColor = .white

        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.08
        cardView.layer.shadowRadius = 8
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)

        iconImageView.contentMode = .scaleAspectFit
    }

    func configure(item: ActionItem) {
        titleLabel.text = item.title
        iconImageView.image = UIImage(named: item.icon)
    }
}
