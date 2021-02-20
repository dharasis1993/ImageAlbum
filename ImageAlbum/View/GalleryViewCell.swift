//
//  GalleryViewCell.swift
//  ImageAlbum
//
//  Created by dharasis behera on 20/02/21.
//

import UIKit
import AlamofireImage
import Alamofire


class GalleryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImage: UIImageView!
    @IBOutlet weak var lblImageTitle: UILabel!
    var galleryCellViewModel: GalleryCellViewModel?{
        didSet{

//                if let imageurl = self.galleryCellViewModel?.image{
//                    self.galleryImage.af.setImage(withURL: imageurl, completion:  { (response) in
//
//                        switch(response.result) {
//                        case .success(let value):
//                            print(value.size.width,value.size.width)
//                        case .failure(let error): break
//                        }
//                    })
//            }
                lblImageTitle.text = galleryCellViewModel?.imageTitle
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = CGFloat(AlbumCollectionCellSettings.cornerRadius)
        self.layer.masksToBounds = true
    }
}
