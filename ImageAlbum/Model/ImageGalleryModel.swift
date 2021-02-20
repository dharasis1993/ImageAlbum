//
//  ImageGalleryModel.swift
//  ImageAlbum
//
//  Created by dharasis behera on 20/02/21.
//

struct ImageGallery: Decodable {
    var albumId: Int?
    var imageTitle: String?
    var imageUrl: String?
    enum CodingKeys: String, CodingKey {
        case albumId = "id"
        case imageTitle = "title"
        case imageUrl = "url"
    }
}
