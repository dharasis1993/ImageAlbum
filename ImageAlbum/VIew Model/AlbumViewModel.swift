//
//  AlbumViewModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 19/02/21.
//

import Foundation

class AlbumViewModel: NSObject{
    
    private var apiClient : APIClient!
   
    var filteredCellViewModel: [AlbumCellViewModel] = [AlbumCellViewModel]()
    
    private var galleryImageList: [ImageGallery] = [ImageGallery]()
  
   
    private var albumCellViewModels: [AlbumCellViewModel] = [AlbumCellViewModel]() {
        didSet {
            filteredCellViewModel = albumCellViewModels
            self.bindAlbumViewModelToController()
        }
    }
    
    var bindAlbumViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiClient =  APIClient()
        getAlbumDatas()
    }
    
    var numberOfAlbums: Int {
        return albumCellViewModels.count
    }
    
   private func getAlbumDatas() {
        self.apiClient.callGetApi(serviceName: APIRouter.album) { (data: Data?, error: NSError?) in
            
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            var albumList = [Album]()
            let decoder = JSONDecoder()
            do{
                albumList =  try decoder.decode([Album].self, from: data)
            }catch{
                return
            }
            var cellViewModel = [AlbumCellViewModel]()
            for album in albumList {
                cellViewModel.append(AlbumCellViewModel(album: album))
            }
            self.albumCellViewModels = cellViewModel
        }

    self.apiClient.callGetApi(serviceName:  APIRouter.image) { (data: Data?, error: NSError?) in
        
        if error != nil {
            return
        }
        guard let data = data else {
            return
        }
        let decoder = JSONDecoder()
        do{
            self.galleryImageList =  try decoder.decode([ImageGallery].self, from: data)
        }catch{
            return
        }
        
    }
}

    func getCellViewModel() -> [AlbumCellViewModel] {
        return albumCellViewModels
    }
    
    func getgalleryImageList() -> [ImageGallery] {
        return galleryImageList
    }
}
