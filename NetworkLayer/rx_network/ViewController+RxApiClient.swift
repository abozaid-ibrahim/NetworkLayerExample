//
//  ViewController+ApiClient.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/22/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

import UIKit
import RxSwift
protocol NetworkCalls {
    func getRemotely<T:Decodable>(
        path:MyRequestBuilder,
        entity:T.Type
        )->Observable<T>
}




 extension UIViewController:NetworkCalls{
    
    func getRemotely<T:Decodable>(
        path:MyRequestBuilder,
        entity:T.Type
        )->Observable<T>
    {
        
        return  RxClient.shared.get(request: path, entity: entity)
    }
    
}
