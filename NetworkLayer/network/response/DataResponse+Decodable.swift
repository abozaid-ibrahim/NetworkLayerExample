//
//  AlamofireResponse.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/16/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//
import Alamofire
extension Data{
    func decode<T:Decodable>( res: T.Type) ->T?  {
        do {
           
            let todo = try JSONDecoder().decode(res.self, from: self)
            return todo
        } catch let err {
            print("Parse Json Error\(err)")
            return nil
        }
    }
}
extension DataResponse {
//    @discardableResult
     func decodable<T:Decodable>( res: T.Type)throws ->T  {
        do {
            guard let data = self.data else {
                throw APIError.dataIsNil
            }
            let todo = try JSONDecoder().decode(res.self, from: data)
            return todo
        } catch let err {
            print("Parse Json Error\(err)")
            throw APIError.jsonParsingFail
        }
    }
    
    
  
}

