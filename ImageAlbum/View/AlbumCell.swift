//
//  AlbumCell.swift
//  ImageAlbum
//
//  Created by dharasis behera on 18/02/21.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    @IBOutlet var albumTitle: UILabel!


    var albumCellViewModel: AlbumCellViewModel?{
        didSet{
            albumTitle.text = albumCellViewModel?.albumTitle
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = CGFloat(AlbumCollectionCellSettings.cornerRadius)
        self.layer.masksToBounds = true
    }
}
