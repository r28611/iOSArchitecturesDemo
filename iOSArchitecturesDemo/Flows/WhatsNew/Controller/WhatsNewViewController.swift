//
//  WhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 22/10/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class WhatsNewViewController: UIViewController {
    
    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var whatsNewView: WhatsNewView {
        return self.view as! WhatsNewView
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = WhatsNewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.whatsNewView.versionNumberLabel.text = "5.6.4"
        self.whatsNewView.timeLabel.text = "6d ago"
        self.whatsNewView.descriptionLabel.text = "Apple Amsterdam. Open tot 20:00 uur. We zijn open. Je bent welkom. Je kunt shoppen door langs te komen, een afspraak te maken voor een persoonlijke sessie"
//        self.whatsNewView.ratingLabel.text = app.averageRating.flatMap { "\($0)" }
    }
    
}
