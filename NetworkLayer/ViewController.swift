//
//  ViewController.swift
//  NetworkLayer
//
//  Created by abuzeid ibrahim on 5/16/18.
//  Copyright © 2018 abuzeid ibarhim. All rights reserved.
//

import UIKit
import RxSwift


class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
   let bag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
        getRemotely(path: UserService.users(), entity: BaseEntity.self).subscribe(onNext: {user in
            
        }, onError: {error in
            
        }).disposed(by: bag)
        
        requestRemotely(path:UserService.login(start: 0, limit: 10),
                        entity: BaseEntity.self,
                        response: {user in
                            
                            
                            
        })
        
    }
    
    @IBAction func unwindToRed(segue: UIStoryboardSegue) {
    }
    
}
