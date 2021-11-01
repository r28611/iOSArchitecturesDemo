//
//  MainMenuViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 27/10/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MainMenuviewController: UIViewController {
    
    // MARK: - Properties
    
    private var whatsNewView: MainMenuView {
        return self.view as! MainMenuView
    }
    private let presenter: MenuOutput
    
    // MARK: - Init
    
    init(presenter: MenuOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = MainMenuView()
        whatsNewView.songButton.addTarget(self, action: #selector(didTappedSong(_:)), for: .touchUpInside)
        whatsNewView.appButton.addTarget(self, action: #selector(didTappedApp(_:)), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Private methods
    
    @objc private func didTappedSong(_ sender: UIButton) {
        presenter.viewDidSelectSong()
    }
    
    @objc private func didTappedApp(_ sender: UIButton) {
        presenter.viewDidSelectApp()
    }
}
