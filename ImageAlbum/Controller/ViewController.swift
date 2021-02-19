//
//  ViewController.swift
//  ImageAlbum
//
//  Created by dharasis behera on 18/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var albumCollectionView: UICollectionView!
    private var albumViewModel : AlbumViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.albumViewModel =  AlbumViewModel()
        self.albumViewModel.bindAlbumViewModelToController = {[weak self = self] in
            self?.albumCollectionView.reloadData()
        }
        
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
       }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.albumCellIdentifier, for: indexPath ) as! AlbumCell
        cell.albumTitle.text = "dahf dshfhs  sdhf saf"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let paddingSpace = Int(Insets.sectionInsets.left) * (AlbumCollectionCellSettings.itemsPerRow + 1)
            let availableWidth = Int(collectionView.frame.width) - paddingSpace
            let widthPerItem = availableWidth / AlbumCollectionCellSettings.itemsPerRow
        let heightPerItem = Double(widthPerItem) * AlbumCollectionCellSettings.widthOfItemScaleFactor
        return CGSize(width: widthPerItem, height: Int(heightPerItem))
    }
    
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
        return Insets.sectionInsets
      }
      
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return Insets.sectionInsets.left
      }
}
