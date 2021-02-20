//
//  GalleryViewController.swift
//  ImageAlbum
//
//  Created by dharasis behera on 20/02/21.
//

import UIKit


class GalleryViewController: UICollectionViewController {
    private var galleryViewModel : GalleryViewModel!
    var albumId: Int?

    override func viewDidLoad() {

        super.viewDidLoad()
        if let albumId = albumId{
            self.galleryViewModel =  GalleryViewModel(with: albumId)
            self.galleryViewModel.bindGalleryViewModelToController = {[weak self = self] in
                self?.collectionView.reloadData()
            }
        }
        
//        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//                   collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//               }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(ImageViewCell.self, forCellWithReuseIdentifier: Identifier.imageCellIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return galleryViewModel.numberOfImages
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.imageCellIdentifier, for: indexPath) as! GalleryViewCell
     
        cell.galleryCellViewModel = galleryViewModel.getCellViewModel(at: indexPath)
        return cell
    }

    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
extension GalleryViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
       let paddingSpace = Int(Insets.ImageCellInsets.left) * (ImageCollectionCellSettings.itemsPerRow + 1)
            let availableWidth = Int(collectionView.frame.width) - paddingSpace
            let widthPerItem = availableWidth / ImageCollectionCellSettings.itemsPerRow
//        let heightPerItem = Double(widthPerItem) * ImageCollectionCellSettings.widthOfItemScaleFactor
        return CGSize(width: widthPerItem, height: 600)
    }

      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
        return Insets.ImageCellInsets
      }

      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return Insets.ImageCellInsets.left
      }
}
