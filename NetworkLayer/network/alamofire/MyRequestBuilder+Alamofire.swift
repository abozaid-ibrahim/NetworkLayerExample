//
//  MyRequestBuilder+Alamofire.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/22/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

import Alamofire
///if you wanna change the third party all you need to do is just creating new Extension to override the http request
extension MyRequestBuilder{
        internal var encoding: ParameterEncoding {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }
    
    
    internal var httpRequest: DataRequest {
        return request(self.requestURL, method: HTTPMethod(rawValue: self.method.rawValue)!, parameters: self.parameters, encoding: self.encoding, headers: self.headers)
        
    }
    
    
}

