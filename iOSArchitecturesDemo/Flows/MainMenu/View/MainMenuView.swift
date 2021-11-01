//
//  MainMenuView.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 27/10/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MainMenuView: UIView {
    
    private(set) lazy var appButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search app", for: .normal)
        return button
    }()
    
    private(set) lazy var songButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search song", for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appButton, songButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 32.0
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
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12.0),
            self.stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0)
            ])
    }
}
