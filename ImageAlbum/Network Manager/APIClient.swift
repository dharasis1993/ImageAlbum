//
//  APIClient.swift
//  ImageAlbum
//
//  Created by dharasis behera on 18/02/21.
//

import UIKit
import Alamofire
import AlamofireImage

class APIClient{
    func callGetApi(serviceName: APIRouter, completionHandler: @escaping (Data?, NSError?) -> Void) {
        AF.request(serviceName).responseString { (response) in
            switch(response.result) {
            case .success(let value):
                if let dataFromString = value.data(using: .utf8, allowLossyConversion: false) {
                    completionHandler(dataFromString, nil)
                }
            case .failure(let error):
                completionHandler(nil, error as NSError)
            }
        }
    }
}


