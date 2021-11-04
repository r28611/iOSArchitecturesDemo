//
//  SongPlayerViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 04/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongPlayerViewController: UIViewController {
    // MARK: - Properties
    
    private let imageDownloader = ImageDownloader()
    
    private var playerView: PlayerView {
        return self.view as! PlayerView
    }
    internal var songModel: SongPlayModel? = nil
    private let viewModel: SongPlayerViewModel
    
    // MARK: - Init
    
    init(viewModel: SongPlayerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = PlayerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.bindViewModel()
    }
    
    // MARK: - Private
    
    private func bindViewModel() {
        self.viewModel.songModel?.addObserver(self) { [weak self] (songModel, _) in
            self?.songModel = songModel
        }
    }
    
    private func configure(with song: SongPlayModel) {
        playerView.trackTitleLabel.text = song.songTitle
        playerView.artictNameLabel.text = song.artistName
        playerView.collectionLabel.text = song.collectionName
//        switch song.playingState {
//        case .notStarted:
//            cell.downloadProgressLabel.text = nil
//        case .inProgress(let progress):
//            let progressToShow = round(progress * 100.0) / 100.0
//            cell.downloadProgressLabel.text = "\(progressToShow)"
//        case .downloaded:
//            cell.downloadProgressLabel.text = "Загружено"
//        }
    }
    
//    private func downloadImage() {
//        guard let url = self.song.artwork else { return }
//        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
//            self?.playerView.imageView.image = image
//        }
//    }
}
