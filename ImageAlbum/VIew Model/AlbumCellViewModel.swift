//
//  AlbumCellViewModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 19/02/21.
//

import Foundation

struct AlbumCellViewModel {
    let albumTitle: String
    init(album: Album) {
        albumTitle = album.albumTitle ?? ""
    }
}


