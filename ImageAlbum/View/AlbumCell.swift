//
//  AlbumCell.swift
//  ImageAlbum
//
//  Created by dharasis behera on 18/02/21.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    @IBOutlet var albumTitle: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = true
    }
}
