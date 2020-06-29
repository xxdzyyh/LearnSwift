//
//  DisposeBagVC.swift
//  LearnSwift
//
//  Created by sckj on 2020/6/28.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DisposeBagVC: UIViewController {

    lazy var disposeBag : DisposeBag = DisposeBag()
    var mySubject = PublishSubject<Any>()
    lazy var button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    }
    
    func setupSubviews() {
        self.button.setTitle("点我", for: .normal)
        self.button.sizeToFit()
        
        self.button.rx.tap.asObservable().subscribe(onNext: { () in
            self.buttonTouchUpInside()
        }).disposed(by: self.disposeBag)
        
        self.view.addSubview(self.button)
    }
    
    var tapCount = 0
    func buttonTouchUpInside() {
        tapCount = tapCount + 1
        self.mySubject.onNext(tapCount)
    }
    
    deinit {
        print("DisposeBagVC init")
    }

}
