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
    static let imageCellIdentifier = "imageCell"
    static let segueIdentifier = "segueToImageVC"
}

struct Insets {
    static let albumCellInsets = UIEdgeInsets(
      top: 5,
      left: 10,
      bottom: 5,
      right: 10)
    
    static let ImageCellInsets = UIEdgeInsets(
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
struct ImageCollectionCellSettings {
    static let itemsPerRow = 1
    static let widthOfItemScaleFactor = 0.8
    static let cornerRadius = 10

}
    
    
