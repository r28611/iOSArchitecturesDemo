//
//  SongPlayModel.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 04/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongPlayModel {
    let songTitle: String
    let artistName: String?
    let collectionName: String?
    let playingState: PlayingSong.PlayingState
}
