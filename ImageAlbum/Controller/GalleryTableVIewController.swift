//
//  GalleryTableVIewController.swift
//  ImageAlbum
//
//  Created by dharasis behera on 21/02/21.
//

import UIKit
import SVProgressHUD

class GalleryTableVIewController: UITableViewController {
    private var galleryViewModel : GalleryViewModel!
    var albumId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.show()

        tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 10
        if let albumId = albumId{
            self.galleryViewModel =  GalleryViewModel(with: albumId)
            self.galleryViewModel.bindGalleryViewModelToController = {[weak self = self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return galleryViewModel.numberOfImages
    }
    
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.imageCellIdentifier, for: indexPath) as! GalleryCell
    cell.delegate = self
    cell.indexPath = indexPath
    cell.galleryCellViewModel =
            galleryViewModel.getCellViewModel(at: indexPath)
    return cell
    }

    deinit {
        print("deinit")
    }
}

extension GalleryTableVIewController: TableCellProtocol{
    func imageDowloaded(indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
        SVProgressHUD.dismiss()

    }
}
