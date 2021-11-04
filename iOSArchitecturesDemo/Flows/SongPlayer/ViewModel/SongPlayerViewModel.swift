//
//  SongPlayerViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 04/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

final class SongPlayerViewModel {
    
    // MARK: - Observable properties
    
    let songModel = Observable<SongPlayModel>?(nil)
    
    // MARK: - Properties
    
    private var song: ITunesSong
    private let imageDownloader = ImageDownloader()
    private let playSongService: PlaySongServiceInterface
    
    // MARK: - Init
    
    init(song: ITunesSong,playSongService: PlaySongServiceInterface) {
        self.song = song
        self.playSongService = playSongService
        playSongService.onProgressUpdate = { [weak self] in
            guard let self = self else { return }
            self.songModel?.value = self.viewModel()
        }
    }
    
    // MARK: - ViewModel methods
    
    func didTapPlay(_ appViewModel: SearchAppCellModel) {
//        guard let app = self.app(with: appViewModel) else { return }
        self.playSongService.startPlayingSong(song)
    }
    
    // MARK: - Private
    
    private func viewModel() -> SongPlayModel {
        let song = self.song
        return SongPlayModel(songTitle: song.trackName,
                             artistName: song.artistName,
                             collectionName: song.collectionName,
                             playingState: songModel?.value.playingState ?? .notStarted)
    }
    
//    private func app(with viewModel: SearchAppCellModel) -> ITunesApp? {
//        return self.apps.first { viewModel.appName == $0.appName }
//    }
}
