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
        callFuncToGetAlbumData()
    }
    
    var numberOfAlbums: Int {
        return albumCellViewModels.count
    }
    
   private func callFuncToGetAlbumData() {
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
    }

    func getCellViewModel() -> [AlbumCellViewModel] {
        return albumCellViewModels
    }
}
