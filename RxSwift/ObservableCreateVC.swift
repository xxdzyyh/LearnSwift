//
//  ObservableCreateVC.swift
//  LearnSwift
//
//  Created by sckj on 2020/7/6.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit
import RxSwift

class ObservableCreateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let observable = Observable<String>.create { (observer) -> Disposable in
            observer.onNext("String A")
            observer.onCompleted()
            return Disposables.create {
                print("Disposed")
            }
        }
        print(observable)
    }

}
