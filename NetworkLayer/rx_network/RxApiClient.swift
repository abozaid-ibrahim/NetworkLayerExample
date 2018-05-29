//
//  RxAlamofire.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/23/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import Alamofire
struct BaseEntity: Decodable {
    let id: Int?
}

class RxClient{
    
    let disposeBag = DisposeBag()
    
    public static let shared = RxClient()
    
    public func rxRequest<T:Decodable>(request:MyRequestBuilder ,
                                       object: T.Type)->Observable<T>{
        return Observable.create( { subscriber in
            
            RxAlamofire.requestData(HTTPMethod(rawValue: request.method.rawValue)!, request.requestURL, parameters: request.parameters, encoding: request.encoding, headers: request.headers)
                .debug()
                .subscribe(onNext: {(response,data) in
                    let user =  data.decode(res: T.self)
                    if let user = user{
                        subscriber.onNext(user)
                    }else{
                        subscriber.onError(APIError.dataIsNil)                    }
                }).disposed(by: self.disposeBag)
            
            return Disposables.create()
        })
    }
    
}
