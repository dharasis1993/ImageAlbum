//
//  GalleryViewModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 20/02/21.
//

import Foundation
import UIKit

class GalleryViewModel: NSObject{
 
    private var apiClient : APIClient!
    private var galleryCellViewModels: [GalleryCellViewModel] = [GalleryCellViewModel]() {
        didSet {
            self.bindGalleryViewModelToController()
        }
    }
    var bindGalleryViewModelToController : (() -> ()) = {}
    
    private var albumId: Int!
    
    init(with albumId: Int) {
        super.init()
        self.albumId = albumId
        self.apiClient =  APIClient()
        getImageDatas()
    }
    var numberOfImages: Int {
        return galleryCellViewModels.count
    }
    
    private func getImageDatas() {
        self.apiClient.callGetApi(serviceName: APIRouter.image(albumId)) { (data: Data?, error: NSError?) in
             
             if error != nil {
                 return
             }
             guard let data = data else {
                 return
             }
             var imageList = [ImageGallery]()
             let decoder = JSONDecoder()
             do{
                imageList =  try decoder.decode([ImageGallery].self, from: data)
             }catch{
                 return
             }
             var cellViewModel = [GalleryCellViewModel]()
             for image in imageList {
                cellViewModel.append(GalleryCellViewModel(gallery: image))
             }
             self.galleryCellViewModels = cellViewModel
         }
    }
    func getCellViewModel( at indexPath: IndexPath ) -> GalleryCellViewModel {
        return galleryCellViewModels[indexPath.row]
    }
    

}
 
struct GalleryCellViewModel {
    let imageTitle: String?
    let image: URL?
    init(gallery: ImageGallery) {
        imageTitle = gallery.imageTitle
        image = URL(string: gallery.imageUrl ?? "")
    }
}
