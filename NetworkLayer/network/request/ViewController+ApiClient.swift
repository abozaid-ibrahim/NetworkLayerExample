//
//  ViewController+ApiClient.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/22/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func requestRemotely<T:Decodable>(
        path:MyRequestBuilder,
        entity:T.Type,
        response:@escaping Success<T>,
        failure:Failure? = nil){
        
        ApiClient.shared.request(endpoint: path, object: entity, success: response,failure:failure)
    }
}
