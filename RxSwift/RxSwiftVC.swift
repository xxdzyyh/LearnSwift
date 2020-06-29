//
//  RxSwiftVC.swift
//  LearnSwift
//
//  Created by sckj on 2020/6/28.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftVC: XFDemoTableViewController {
    
    lazy var disposeBag : DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = [[ActionKey.value:"showDisposeBagVC",ActionKey.key:ActionType.Method],]
    }
    
    
    @objc func showDisposeBagVC() {
        let vc = DisposeBagVC()
        
        vc.mySubject.subscribe(onNext: { (res) in
            print("mySubject onNext \(res)")
        }, onError: { (error) in
            print("mySubject onError")
        }, onCompleted: {
            print("mySubject onCompleted")
        }) {
            print("mySubject disposed")
        }.disposed(by: self.disposeBag)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
