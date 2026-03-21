//
//  PersonalInfoCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class PersonalInfoCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var personalInfoLable: UILabel!
    @IBOutlet weak var viewAll: UIButton!

    private var items: [InfoItem] = []

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
        contentView.backgroundColor = .clear

        // Outer Card
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.05
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)

        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear

        tableView.register(
            UINib(nibName: "PersonalInfoRowCell", bundle: nil),
            forCellReuseIdentifier: "PersonalInfoRowCell"
        )
    }

    func configure(items: [InfoItem]) {
        self.items = items
        tableView.reloadData()
    }
}

extension PersonalInfoCell: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "PersonalInfoRowCell",
            for: indexPath
        ) as! PersonalInfoRowCell

        cell.configure(item: items[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }
}
