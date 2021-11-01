//
//  MainMenuPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 27/10/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MainMenuPresenter: MenuOutput {
    
    weak var viewInput: UIViewController?
    
    func viewDidSelectApp() {
        let vc = SearchModuleBuilder.build()
        vc.navigationItem.title = "Search via App Store"
        self.viewInput?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func viewDidSelectSong() {
        let vc = SearchModuleBuilder.build()
        vc.navigationItem.title = "Search via iTunes"
        self.viewInput?.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

