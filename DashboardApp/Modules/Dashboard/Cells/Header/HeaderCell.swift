//
//  HeaderCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class HeaderCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var statusLabel: PaddingLabel!
    @IBOutlet weak var accountTypeLabel: PaddingLabel!
    @IBOutlet weak var dividerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        
        cardView.layer.cornerRadius = 16
        cardView.backgroundColor = .white
        
        cardView.layer.maskedCorners = [
            .layerMinXMinYCorner,   // top-left
            .layerMaxXMinYCorner    // top-right
        ]
        cardView.clipsToBounds = true
        
        profileImageView.layer.cornerRadius = 12
        
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        mobileLabel.font = UIFont.systemFont(ofSize: 15)
        
        statusLabel.backgroundColor = UIColor(
            red: 0.90, green: 0.96, blue: 0.90, alpha: 1.0
        )

        statusLabel.textColor = UIColor(
            red: 0.12, green: 0.50, blue: 0.18, alpha: 1.0
        )

        statusLabel.layer.cornerRadius = 10
        statusLabel.clipsToBounds = true

        statusLabel.layer.borderWidth = 1
        statusLabel.layer.borderColor = UIColor(
            red: 0.75, green: 0.88, blue: 0.75, alpha: 1.0
        ).cgColor

        accountTypeLabel.backgroundColor = UIColor(
            red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0
        )

        accountTypeLabel.textColor = UIColor.black

        accountTypeLabel.layer.cornerRadius = 10
        accountTypeLabel.clipsToBounds = true

        accountTypeLabel.layer.borderWidth = 1
        accountTypeLabel.layer.borderColor = UIColor(
            red: 0.80, green: 0.80, blue: 0.80, alpha: 1.0
        ).cgColor
    }

    func configure(user: User) {
        nameLabel.text = user.name
        mobileLabel.text = user.mobile
        statusLabel.text = " \(user.status) "
    }
}

class PaddingLabel: UILabel {

    var insets = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + insets.left + insets.right,
            height: size.height + insets.top + insets.bottom
        )
    }
}
