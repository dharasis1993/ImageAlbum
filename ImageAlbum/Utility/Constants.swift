//
//  Constants.swift
//  ImageAlbum
//
//  Created by dharasis behera on 18/02/21.
//

import Foundation
import UIKit

struct ProductionServer {
    static let baseURL = "https://jsonplaceholder.typicode.com/"
}

struct Identifier {
    static let albumCellIdentifier = "albumCell"
}

struct Insets {
    static let sectionInsets = UIEdgeInsets(
      top: 20,
      left: 20,
      bottom: 50,
      right: 20)
}

struct AlbumCollectionCellSettings {
    static let itemsPerRow = 1
    static let widthOfItemScaleFactor = 0.3
}
    
