//
//  PlayerView.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 04/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class PlayerView: UIView {
    
    // MARK: - Subviews
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var trackTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var artictNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Play", for: .normal)
        button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private(set) lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
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
        backgroundColor = .white
        self.addSubview(self.imageView)
        self.addSubview(self.trackTitleLabel)
        self.addSubview(self.artictNameLabel)
        self.addSubview(self.collectionLabel)
        self.addSubview(self.playButton)
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.imageView.widthAnchor.constraint(equalToConstant: 120.0),
            self.imageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            self.trackTitleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.trackTitleLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 16.0),
            self.trackTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            self.artictNameLabel.topAnchor.constraint(equalTo: self.trackTitleLabel.bottomAnchor, constant: 12.0),
            self.artictNameLabel.leftAnchor.constraint(equalTo: self.trackTitleLabel.leftAnchor),
            self.artictNameLabel.rightAnchor.constraint(equalTo: self.trackTitleLabel.rightAnchor),
            
            self.collectionLabel.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.collectionLabel.leftAnchor.constraint(equalTo: self.trackTitleLabel.leftAnchor),
            self.collectionLabel.rightAnchor.constraint(equalTo: self.trackTitleLabel.rightAnchor),
            
            self.playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.playButton.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 16.0),
            self.playButton.widthAnchor.constraint(equalToConstant: 80.0),
            self.playButton.heightAnchor.constraint(equalToConstant: 32.0),
            
            ])
    }
}
