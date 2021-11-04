//
//  SongPlayerModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 04/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongPlayerModuleBuilder {
    static func build(song: ITunesSong) -> UIViewController {
        let playSongService = FakePlaySongService()
        let viewModel = SongPlayerViewModel(song: song, playSongService: playSongService)
        let viewController = SongPlayerViewController(viewModel: viewModel)
        return viewController
    }
}
