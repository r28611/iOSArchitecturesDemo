//
//  MainMenuBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 01/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MainMenuBuilder {
    
    static func build() -> (UIViewController) {
        let presenter = MainMenuPresenter()
        let viewController = MainMenuviewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
