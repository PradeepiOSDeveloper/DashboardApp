//
//  CustomPageControl.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 22/03/26.
//

import UIKit

final class CustomPageControl: UIView {

    private var indicators: [UIView] = []

    var numberOfPages: Int = 0 {
        didSet { setupIndicators() }
    }

    var currentPage: Int = 0 {
        didSet { updateIndicators() }
    }

    private let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStack()
    }

    private func setupStack() {
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupIndicators() {
        indicators.forEach { $0.removeFromSuperview() }
        indicators.removeAll()

        for _ in 0..<numberOfPages {

            let view = UIView()
            view.layer.cornerRadius = 4
            view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)

            view.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 24),  // ✅ long pill
                view.heightAnchor.constraint(equalToConstant: 6)
            ])

            indicators.append(view)
            stackView.addArrangedSubview(view)
        }

        updateIndicators()
    }

    private func updateIndicators() {
        for (index, view) in indicators.enumerated() {

            UIView.animate(withDuration: 0.25) {
                view.backgroundColor = (index == self.currentPage)
                    ? .black
                    : UIColor.lightGray.withAlphaComponent(0.5)
            }
        }
    }
}
