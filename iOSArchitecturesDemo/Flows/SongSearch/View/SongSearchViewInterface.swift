//
//  SongSearchViewInterface.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 01/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol SongSearchViewInput: class {
    
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    
    func showNoResults()
    
    func hideNoResults()
    
    func throbber(show: Bool)
}

protocol SongSearchViewOutput: class {
    
    func viewDidSearch(with query: String)
}
