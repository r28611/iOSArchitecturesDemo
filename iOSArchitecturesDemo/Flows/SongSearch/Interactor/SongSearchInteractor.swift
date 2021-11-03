//
//  SongSearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 03/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Alamofire

protocol SongSearchInteractorInput {
    
    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SongSearchInteractor: SongSearchInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
