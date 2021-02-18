//
//  APIRouter.swift
//  ImageAlbum
//
//  Created by dharasis behera on 18/02/21.
//


import Alamofire

enum APIRouter : URLRequestConvertible{
    case album
    case image
    

    private var method: HTTPMethod{
        switch self {
        case .album:
            return .get
        case .image:
            return .get
        }
    }
    
    private var path: String{
        switch self {
        case .album:
            return "/albums"
        case .image:
            return "/photos"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try ProductionServer.baseURL.asURL()
        var urlRequest =  URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}


