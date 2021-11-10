//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 01/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongSearchPresenter {
    
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    
    let interactor: SongSearchInteractorInput
    let router: SongSearchRouterInput

    init(interactor: SongSearchInteractorInput, router: SongSearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestSongs(with query: String) {
        self.interactor.requestSong(with: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
}

// MARK: - SearchViewOutput
extension SongSearchPresenter: SongSearchViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSongs(with: query)
    }
    
    func viewDidSelectApp(_ song: ITunesSong) {
        self.router.openPlayer(for: song)
    }
}

