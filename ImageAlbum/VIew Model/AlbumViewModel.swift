//
//  AlbumViewModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 19/02/21.
//

import Foundation

class AlbumViewModel: NSObject{
    
    private var apiClient : APIClient!
    private(set) var albumData : [Album]? {
        didSet {
            self.bindAlbumViewModelToController()
        }
    }
    
    var bindAlbumViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiClient =  APIClient()
        callFuncToGetAlbumData()
    }
    
   private func callFuncToGetAlbumData() {
        self.apiClient.callGetApi(serviceName: APIRouter.album) { (data: Data?, error: NSError?) in
            
            if error != nil {
                return
            }
            guard let albumData = data else {
                return
            }
            
            let decoder = JSONDecoder()
            let album = try? decoder.decode([Album].self, from: albumData)
        }
    }
}
