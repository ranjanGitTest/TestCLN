//
//  PhotosModel.swift
//  TestCL
//
//  Created by Ranjan on 16/08/24.
//

import Foundation

// MARK: - PhotosModel
struct PhotosModel: Codable {
    let total, totalHits: Int
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let id: Int
    let pageURL: String
    let type, tags: String
    var previewURL: String
}
