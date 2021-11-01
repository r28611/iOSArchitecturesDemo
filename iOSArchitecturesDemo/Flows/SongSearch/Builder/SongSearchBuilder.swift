//
//  SongSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 01/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongSearchModuleBuilder {
    
    static func build() -> (UIViewController & SongSearchViewInput) {
        let presenter = SongSearchPresenter()
        let viewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
