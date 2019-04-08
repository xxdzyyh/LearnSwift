//
//  MoyaDemoVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/4/8.
//  Copyright © 2019 yunmai. All rights reserved.
//

import Foundation
import Moya
import RxSwift

enum Api {
    case zen
    case userProfile(String)
}

extension Api : TargetType {
    var sampleData: Data {
        return "getList".data(using: String.Encoding.utf8)!
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        return (URL(string: "https://api.github.com"))!
    }
    
    var path: String {
        switch self {
        case .zen:
            return "/zen"
        case .userProfile(let name):
            return "/users/\(name)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
}

class MoyaDemoVC : XFDemoTableViewController {
    
    let Api = MoyaProvider<Api>()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Api.rx.request(.zen, callbackQueue: DispatchQueue.main)
            .asObservable()
            .mapString()
            .subscribe { event in 
                switch event {
                case let .next(response):
                    print(response)
                case let .error(error):
                print(error)
                case .completed:
                    print("complet")
                }
        }.disposed(by: bag)
        
        Api.rx.request(.zen)
        .asObservable()
        .mapString()
            .subscribe(onNext: { (s) in
                print(s)
            }, onError: { (e) in
                print(e)
            }, onCompleted: { 
                print("complete")
            }, onDisposed: {
                print("dispose")
            })
        .disposed(by: bag)
        
        /*!
         可以选择处理订阅的事件类型
         */
        Api.rx.request(.zen)
            .asObservable()
            .mapString()
            .subscribe(onNext: { (s) in
                print(s)
            })
            .disposed(by: bag)
    }
}
