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
       
        getRemotely(path: UserApi.users(), entity: BaseEntity.self).subscribe(onNext: {user in
            print(">>user object is .....")
            print(user)
        }, onError: {error in
            print(">>>error")
        }).disposed(by: bag)
//
        getRemotely(path: UserApi.albums(), entity: AlbumsEntity.self).subscribe(onNext: {user in
            print(">>album object is .....")
            print(user)
        }, onError: {error in
            print(">>>error")
        }).disposed(by: bag)
        


        
    }
    
    @IBAction func unwindToRed(segue: UIStoryboardSegue) {
    }
    
}
