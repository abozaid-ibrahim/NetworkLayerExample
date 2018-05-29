//
//  File.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/22/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

import Foundation
// 1:

enum UserApi {
    case posts(start: Int, limit: Int)
    case albums()
    case users()
}

// 2:
extension UserApi: MyRequestBuilder {
    var headers: [String : String]? {
        return [:]
    }
    
    var path: String {
        switch self {
            
        case .posts(_, _):
            return "posts/1"
        case .users():
            return "users"
        case .albums():
            return "albums/1"
        }
    }
    var method: MyHttpMethods {
        
        switch self {
        case .users():
            return .get
        default:
            return .post
        }
        
    }
    
    // 6:
    var parameters: Parameters? {
        switch self {
        case .posts(let start, let limit):
            return ["start": start, "limit": limit,"lang":"en"]
        case .users():
            var parameters = [String: Any]()
            parameters["start"] = 0
            parameters["limit"] = 0
            parameters["category_id"] = 0
            parameters["lang"] = "en"
            return nil
        default:
            return nil
        }
    }
    
    
}






