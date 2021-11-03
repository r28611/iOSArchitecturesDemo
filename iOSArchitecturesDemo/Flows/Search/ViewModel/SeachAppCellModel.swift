//
//  SeachAppCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Margarita Novokhatskaia on 03/11/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SearchAppCellModel {
    let appName: String
    let company: String?
    let averageRating: Float?
    let downloadState: DownloadingApp.DownloadState
}
