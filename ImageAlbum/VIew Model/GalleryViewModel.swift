//
//  GalleryViewModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 20/02/21.
//

import Foundation

class GalleryViewModel{
 
    private var galleryModel: [ImageGallery]
    private var galleryCellViewModels: [GalleryCellViewModel]!

    
    init(with galleryList: [ImageGallery]) {
        self.galleryModel = galleryList
        configureGalleryCellViewModel()
    }
    
    private func configureGalleryCellViewModel(){
        var galleryCellViewModel = [GalleryCellViewModel]()
        for gallery in self.galleryModel {
            galleryCellViewModel.append(GalleryCellViewModel(gallery: gallery))
        }
        self.galleryCellViewModels = galleryCellViewModel
    }
}
 
