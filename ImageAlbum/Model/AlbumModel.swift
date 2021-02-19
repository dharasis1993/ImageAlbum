//
//  AlbumModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 19/02/21.
//

import Foundation
struct Album: Decodable {
    var userId: Int?
    var albumId: Int?
    var albumTitle: String?
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case albumId = "id"
        case albumTitle = "title"
    }
}
