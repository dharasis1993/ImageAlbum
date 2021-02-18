//
//  AlbumModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 19/02/21.
//

import Foundation
struct Album {
    var userId: Int
    var albumId: Int
    var albumTitle: String
    init?(userId: Int?, albumId: Int?, albumTitle: String?) {
        guard let userId = userId,
              let albumId = albumId,
              let albumTitle = albumTitle
            else {
              return nil
            }
            self.userId = userId
            self.albumId = albumId
            self.albumTitle = albumTitle
          }
    }
