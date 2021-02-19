//
//  Constants.swift
//  ImageAlbum
//
//  Created by dharasis behera on 18/02/21.
//

import Foundation
import UIKit

struct ProductionServer {
    static let baseURL = "https://jsonplaceholder.typicode.com"
}

struct Identifier {
    static let albumCellIdentifier = "albumCell"
}

struct Insets {
    static let sectionInsets = UIEdgeInsets(
      top: 5,
      left: 10,
      bottom: 5,
      right: 10)
}

struct AlbumCollectionCellSettings {
    static let itemsPerRow = 1
    static let widthOfItemScaleFactor = 0.3
    static let cornerRadius = 10

}
    
