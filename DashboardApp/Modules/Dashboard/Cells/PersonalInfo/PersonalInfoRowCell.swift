//
//  InfoCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class PersonalInfoRowCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        cardView.backgroundColor = UIColor.systemGray6
        cardView.layer.cornerRadius = 10
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        
        statusLabel.layer.cornerRadius = 10
        statusLabel.clipsToBounds = true
    }
    
    func configure(item: InfoItem) {
        titleLabel.text = item.title
        dateLabel.text = item.date
        titleImage.image = UIImage(named: item.icon)
        statusLabel.text = item.status
        
        applyStatusStyle(title: item.title)
    }
    
    private func applyStatusStyle(title: String) {
        
        switch title {
        case "Work":
            statusLabel.backgroundColor = UIColor(red: 0.90, green: 0.96, blue: 0.90, alpha: 1)
            statusLabel.textColor = UIColor(red: 0.12, green: 0.50, blue: 0.18, alpha: 1)
            statusLabel.layer.borderWidth = 1
            statusLabel.layer.borderColor = UIColor(red: 0.12, green: 0.50, blue: 0.18, alpha: 1).cgColor
            
        case "Home":
            statusLabel.backgroundColor = UIColor(red: 0.90, green: 0.94, blue: 0.98, alpha: 1)
            statusLabel.textColor = UIColor(red: 0.12, green: 0.40, blue: 0.75, alpha: 1)
            statusLabel.layer.borderWidth = 1
            statusLabel.layer.borderColor = UIColor(red: 0.12, green: 0.40, blue: 0.75, alpha: 1).cgColor
            
        default:
            statusLabel.backgroundColor = UIColor(red: 0.99, green: 0.93, blue: 0.88, alpha: 1)
            statusLabel.textColor = UIColor(red: 0.85, green: 0.45, blue: 0.10, alpha: 1)
            statusLabel.layer.borderWidth = 1
            statusLabel.layer.borderColor = UIColor(red: 0.85, green: 0.45, blue: 0.10, alpha: 1).cgColor
        }
    }
}
