//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 01/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let title: String
    let artist: String?
    let collection: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(title: model.trackName,
                            artist: model.artistName,
                             collection: model.collectionName)
    }
}
