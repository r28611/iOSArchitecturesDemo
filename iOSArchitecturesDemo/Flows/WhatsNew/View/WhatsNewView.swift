//
//  WhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 22/10/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class WhatsNewView: UIView {
    
    // MARK: - Subviews

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "What's New"
        return label
    }()
    
    private(set) lazy var versionHistoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Version History", for: .normal)
        return button
    }()
    
    private lazy var titleHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, versionHistoryButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        return stackView
    }()
    
    private(set) lazy var versionNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()

    private(set) lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        return label
    }()
    
    private lazy var descriptionHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [versionNumberLabel, timeLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        return stackView
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleHorizontalStackView, descriptionHorizontalStackView, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16.0
        return stackView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    // MARK: - UI
    
    private func setupLayout() {
        self.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            self.verticalStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.verticalStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12.0),
            self.verticalStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.verticalStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            self.versionHistoryButton.heightAnchor.constraint(equalToConstant: 32.0)
            ])
    }
}
