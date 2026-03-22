//
//  CarouselCell.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class CarouselCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let pageControl = CustomPageControl()

    private var items: [CarouselItem] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    private func setupCollectionView() {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16

        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .clear

        collectionView.isPagingEnabled = false

        collectionView.register(
            UINib(nibName: "CarouselItemCell", bundle: nil),
            forCellWithReuseIdentifier: "CarouselItemCell"
        )
        
        contentView.addSubview(pageControl)

        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 10),
            pageControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(items: [CarouselItem]) {
        self.items = items
        pageControl.numberOfPages = items.count
        pageControl.currentPage = 0
        collectionView.reloadData()
    }
}

extension CarouselCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CarouselItemCell",
            for: indexPath
        ) as! CarouselItemCell

        cell.configure(item: items[indexPath.item])
        return cell
    }
}

extension CarouselCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width - 40
        return CGSize(width: width, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        let inset = (collectionView.frame.width - (collectionView.frame.width - 40)) / 2
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
}

extension CarouselCell: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updatePage()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            updatePage()
        }
    }

    private func updatePage() {
        let page = Int(round(collectionView.contentOffset.x / collectionView.frame.width))
        pageControl.currentPage = page
    }
}
