//
//  withLatestFromVC.swift
//  LearnSwift
//
//  Created by sckj on 2020/7/16.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit
import RxSwift

class withLatestFromVC: UIViewController {
    let o1 = PublishSubject<Int>()
    let o2 = PublishSubject<String>()

    let disposeBag = DisposeBag()
    
    lazy var textField: UITextField = {
        let tf = UITextField.init(frame: CGRect.zero)
        tf.borderStyle = .roundedRect
        tf.placeholder = "输入搜索内容(超过6个字部分会被舍弃)"
        return tf
    }()
    
    
    lazy var button: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setTitle("搜索", for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.textField)
        self.view.addSubview(self.button)
        
        self.textField.snp.makeConstraints { (make) in
            make.top.equalTo(60)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(30)
        }
        
        self.button.snp.makeConstraints { (make) in
            make.top.equalTo(self.textField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        self.button.rx.tap.withLatestFrom(self.textField.rx.text.orEmpty.filter({ (text) -> Bool in
            return text.count <= 6
        })).subscribe(onNext: { (res) in
            let s : String = res
            print("开始搜索关键字",s)
        }).disposed(by: self.disposeBag)
    }
    

    func test1() {
        let o3 = o1.withLatestFrom(o2)
            
        o3.subscribe { event in
            switch event {
            case .next(let element):
                print("element:", element)
            case .error(let error):
                print("error:", error)
            case .completed:
                print("completed")
            }}.disposed(by: self.disposeBag)
        /**
                        
         
         */
        o1.onNext(0)
        o2.onNext("aaaa")
        o2.onNext("1234")
        o1.onNext(1)
        o2.onNext("kkkkk")
        o1.onNext(1)
        o2.onNext("9876")
        o2.onError(NSError(domain: "2222", code: 0, userInfo: nil))
        o1.onNext(1)
        o1.onError(NSError(domain: "1111", code: 0, userInfo: nil))
    }

    func test2() {
        o1.withLatestFrom(o2) { (pb1Value, string) -> (Int,String) in
            print(pb1Value,string)
            return (pb1Value,string)
        }.subscribe(onNext: { (v1,v2) in
            print(v1,v2)
        }).disposed(by: self.disposeBag)
    }
}
