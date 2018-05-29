//
//  RxAlamofire.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/23/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire


class RxClient{
    
    private let disposeBag = DisposeBag()
    public static let shared = RxClient()
    
    public func get<T:Decodable>(request:MyRequestBuilder ,
                                       entity: T.Type)->Observable<T>{
        return Observable.create( { subscriber in
            
            RxAlamofire.requestData(HTTPMethod(rawValue: request.method.rawValue)!, request.requestURL, parameters: request.parameters, encoding: request.encoding, headers: request.headers)
                .debug()
                .subscribe(onNext: {(response,data) in
                    print("Json Response>>>\n\(String(data:data, encoding: .utf8) ?? "")" )

                    let decodable =  data.decode(decodabel: entity)
                    if let result = decodable{
                        subscriber.onNext(result)
                        subscriber.onCompleted()
                    }else{
                        subscriber.onError(APIError.dataIsNil)                    }
                }).disposed(by: self.disposeBag)
            
            return Disposables.create()
        })
    }
    
}
