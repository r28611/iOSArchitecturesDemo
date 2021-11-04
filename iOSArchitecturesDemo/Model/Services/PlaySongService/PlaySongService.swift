//
//  PlaySongService.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 04/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol PlaySongServiceInterface: class {
    var onProgressUpdate: (() -> Void)? { get set }
    func startPlayingSong(_ song: ITunesSong)
}

final class PlayingSong {
    enum PlayingState {
        case notStarted
        case inProgress(progress: Double)
        case finished
    }
    
    let song: ITunesSong
    
    var playingState: PlayingState = .notStarted
    
    init(song: ITunesSong) {
        self.song = song
    }
}

final class FakePlaySongService: PlaySongServiceInterface {
    
    // MARK: - DownloadAppsServiceInterface
    
    var onProgressUpdate: (() -> Void)?
    
    func startPlayingSong(_ song: ITunesSong) {
        let playingSong = PlayingSong(song: song)
        self.startTimer(for: playingSong)
    }
    
    // MARK: - Private properties
    
    private var timers: [Timer] = []
    
    // MARK: - Private
    
    private func startTimer(for playingSong: PlayingSong) {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] timer in
            switch playingSong.playingState {
            case .notStarted:
                playingSong.playingState = .inProgress(progress: 0.05)
            case .inProgress(let progress):
                let newProgress = progress + 0.05
                if newProgress >= 1 {
                    playingSong.playingState = .finished
                    self?.invalidateTimer(timer)
                } else {
                    playingSong.playingState = .inProgress(progress: progress + 0.05)
                }
            case .finished:
                self?.invalidateTimer(timer)
            }
            self?.onProgressUpdate?()
        }
        RunLoop.main.add(timer, forMode: .common)
        self.timers.append(timer)
    }
    
    private func invalidateTimer(_ timer: Timer) {
        timer.invalidate()
        self.timers.removeAll { $0 === timer }
    }
}
