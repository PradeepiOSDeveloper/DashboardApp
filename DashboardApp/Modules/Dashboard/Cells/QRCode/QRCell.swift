//
//  QRCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class QRCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var qrImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupUI()
    }

    private func setupUI() {
        cardView.backgroundColor = .white
        qrImageView.tintColor = .black
    }
}
