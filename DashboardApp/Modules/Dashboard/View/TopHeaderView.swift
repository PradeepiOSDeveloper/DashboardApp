//
//  TopHeaderView.swift
//  DashboardApp
//
//  Created by Pradeep Chowdary on 21/03/26.
//

import UIKit

final class TopHeaderView: UIView {

    private let greetingLabel = UILabel()
    private let settingsButton = UIButton()
    private let notificationButton = UIButton()
    
    private let stack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {

        // MARK: Greeting
        greetingLabel.text = "👋 Welcome Back!"
        greetingLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)

        // MARK: Buttons
        settingsButton.setImage(UIImage(named: "settings_icon"), for: .normal)
        notificationButton.setImage(UIImage(named: "notification_icon"), for: .normal)

        [settingsButton, notificationButton].forEach {
            $0.tintColor = .clear   // IMPORTANT: disable tint for asset images
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            // Ensure image fits nicely
            $0.imageView?.contentMode = .scaleToFill
            $0.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
            
            NSLayoutConstraint.activate([
                $0.widthAnchor.constraint(equalToConstant: 45),
                $0.heightAnchor.constraint(equalToConstant: 45)
            ])
        }

        let buttonStack = UIStackView(arrangedSubviews: [settingsButton, notificationButton])
        buttonStack.axis = .horizontal

        // MARK: Main Stack
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing

        stack.addArrangedSubview(greetingLabel)
        stack.addArrangedSubview(buttonStack)

        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
