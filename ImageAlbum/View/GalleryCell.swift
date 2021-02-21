//
//  GalleryCell.swift
//  ImageAlbum
//
//  Created by dharasis behera on 21/02/21.
//

import UIKit
protocol TableCellProtocol: NSObject {
    func imageDowloaded(indexPath: IndexPath)
}


class GalleryCell: UITableViewCell {
    @IBOutlet weak var galleryImage: UIImageView!
    @IBOutlet weak var lblImageTitle: UILabel!
    weak var delegate: TableCellProtocol?
    var indexPath: IndexPath?

    @IBOutlet weak var imageHeightConstant: NSLayoutConstraint!
    var galleryCellViewModel: GalleryCellViewModel?{
        didSet{
                if let imageurl = self.galleryCellViewModel?.image{
                        self.galleryImage.af.setImage(withURL: imageurl,placeholderImage: UIImage(named: "placeholder"), completion: {[weak self = self](response) in
                            guard let self = self else{
                                return
                            }
                            switch(response.result) {
                            
                           
                            
                            case .success(let value):

                                self.imageHeightConstant.constant = self.getAspectRatioAccordingToiPhones(cellImageFrame: self.frame.size,downloadedImage: value)
                                self.delegate?.imageDowloaded(indexPath: self.indexPath!)
                                self.lblImageTitle.text = self.galleryCellViewModel?.imageTitle

                            case .failure(let _): break

                            }
                        })

                        }
            }
          
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getAspectRatioAccordingToiPhones(cellImageFrame:CGSize,downloadedImage: UIImage)->CGFloat {
          let widthOffset = downloadedImage.size.width - cellImageFrame.width
          let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
          let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
          let effectiveHeight = downloadedImage.size.height - heightOffset
          return(effectiveHeight)
      }

}
