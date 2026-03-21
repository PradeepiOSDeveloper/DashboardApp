//
//  ActionCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class ActionCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    private var actions: [ActionItem] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear

        collectionView.register(
            UINib(nibName: "ActionItemCell", bundle: nil),
            forCellWithReuseIdentifier: "ActionItemCell"
        )

        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func configure(actions: [ActionItem]) {
        self.actions = actions
        collectionView.reloadData()
    }
}

extension ActionCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ActionItemCell",
            for: indexPath
        ) as! ActionItemCell

        cell.configure(item: actions[indexPath.item])
        return cell
    }
}

extension ActionCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        let totalCellWidth = 100 * actions.count
        let totalSpacingWidth = 48 * (actions.count - 1)

        let totalWidth = totalCellWidth + totalSpacingWidth

        let leftInset = max((Int(collectionView.bounds.width) - totalWidth) / 2, 0)

        return UIEdgeInsets(top: 0, left: CGFloat(leftInset), bottom: 0, right: CGFloat(leftInset))
    }
}
