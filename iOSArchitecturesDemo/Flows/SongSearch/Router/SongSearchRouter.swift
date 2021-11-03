//
//  SongSearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 03/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchRouterInput {
    
    func openPlayer(for song: ITunesSong)

}

final class SongSearchRouter: SongSearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openPlayer(for song: ITunesSong) {
        /* TODO: implement SongPlayerViewController
        let songPlayerViewController = SongPlayerViewController(song: song)
        self.viewController?.navigationController?.pushViewController(songPlayerViewController, animated: true)
         */
    }
    
}
