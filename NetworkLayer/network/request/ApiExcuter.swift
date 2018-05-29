//
//  ApiExcuter.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/22/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

//enum ServerResponse<T> {
//    case success(T:Decodable), failure(APIError)
//}
typealias Failure = (APIError)->()
typealias Success<T> = (T)->()

final class ApiClient {
    public static let shared = ApiClient()
    
    public func request<T:Decodable>(endpoint:MyRequestBuilder ,
                                 object: T.Type,
                                 success:  @escaping Success<T>,
                                 failure: Failure? = nil){
        
        endpoint.httpRequest.responseData(completionHandler: {dataResponse in
            do{
              let response =  try dataResponse.decodable(res: object)
                success(response)
            }catch let err{
                failure?(err as! APIError)
            }
        })
    
    }
    
}
