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
        self.whatsNewView.versionNumberLabel.text = app.version
        self.whatsNewView.timeLabel.text = howLongAgoString(interval: Date() - app.currentVersionReleaseDate?.toDate())
        self.whatsNewView.descriptionLabel.text = app.releaseNotes
    }
    
    // не знаю как красиво сделать :/
    func howLongAgoString(interval:(year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?)) -> String {
        if let year = interval.year,
           year > 0 { return "\(year)y ago" }
        if let month = interval.month,
            month > 0 { return "\(month)mo ago" }
        if let day = interval.day,
            day > 0 { return "\(day)d ago" }
        if let hour = interval.hour,
           hour > 0 { return "\(hour)h ago" }
        if let minute = interval.minute,
           minute > 0 { return "\(minute)m ago" }
        if let second = interval.second,
           second > 0 { return "\(second)s ago" }
        else {
            return ""
        }
    }
}
