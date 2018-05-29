//
//  File.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/22/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

import Foundation
// 1:

let lang = "ar"// LanguageManager.sharedInstance.getSelectedLocale()
enum UserService {
    case login(start: Int, limit: Int)
    case users()
}

// 2:
extension UserService: MyRequestBuilder {
    var headers: [String : String]? {
        return [:]
    }
    var baseURL: URL { return URL(string: "apiConstants.base_url")! }
    
    var path: String {
        switch self {
            
        case .login(_, _):
            return "categories"
        case .users():
            return "users"
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
        case .login(let start, let limit):
            return ["start": start, "limit": limit,"lang":lang]
        case .users():
            var parameters = [String: Any]()
            parameters["start"] = 0
            parameters["limit"] = 0
            parameters["category_id"] = 0
            parameters["lang"] = lang
            return nil
            
        }
    }
    
    
}






