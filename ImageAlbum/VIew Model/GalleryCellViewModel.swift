//
//  GalleryCellViewModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 20/02/21.
//

import Foundation
import UIKit

struct GalleryCellViewModel {
    let imageTitle: String
    let image: String
    init(gallery: ImageGallery) {
        imageTitle = gallery.imageTitle ?? ""
        image = gallery.imageUrl ?? ""
    }
}


