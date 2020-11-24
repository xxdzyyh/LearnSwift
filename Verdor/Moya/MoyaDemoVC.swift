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

/**
 Moya是一个网络库，专注于以类型安全的方式封装网络请求，通常通过使用枚举（例如enum）在与您的网络层一起使用时提供编译时保证和信心以及增加的可发现性。
 
 Moya是一个极其通用的网络库，具有太多的附加功能，无法在本教程中全面介绍，但是绝对值得一提：

 响应式扩展： Moya为RxSwift和ReactiveSwift提供并维护了Moya两种出色的响应式添加，分别命名为RxMoya和ReactiveMoya。
 插件：Moya可让您创建名为Plugins的片段，可用于修改请求和响应或执行副作用。例如，它对于记录请求和响应或在运行网络请求时自动显示网络活动指示符很有用。
 测试：如前所述，每个属性TargetType都有一个sampleData属性，您可以在其中为端点提供桩头响应。创建时MoyaProvider，您可以提供stubClosure，定义要Moya返回存根响应还是真实响应（默认值）。您可以在Moya的测试文档中了解更多信息。
 Harvey：说到响应响应-Moya背后的一些团队正在开发一个名为Harvey的独立框架，以轻松模拟网络响应。它仍处于早期开发阶段，但我强烈建议您跟随这个项目。
 
 在您的应用中，Moya从事于高层抽象的工作. 它通过以下管道实现了这一点.

 你不应用直接引用Alamofire. 虽然它是一个很棒的库,但是Moya的观点是你不必处理那些低级的细节。
 
 Moya被设计的超级灵活且满足了每个开发者的需求. 它不是一个实现网络请求的编码性的框架（那是Alamofire的责任），更多的是关于如何考虑网络请求的框架.
 
 面试问题：为什么要使用Moya
 
 
 */

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
        return (URL(string: "http://api.github.com"))!
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
        switch self {
        case .zen:
            return .requestPlain
        default:
            return .requestPlain
        }
    }
}

class MoyaDemoVC : XFDemoTableViewController {
    
    let Api = MoyaProvider<Api>()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        /**
//         订阅全部事件
//         */
//        Api.rx.request(.zen, callbackQueue: DispatchQueue.main)
//            .asObservable()
//            .mapString()
//            .subscribe { event in
//                switch event {
//                case let .next(response):
//                    print(response)
//                case let .error(error):
//                print(error)
//                case .completed:
//                    print("complet")
//                }
//        }.disposed(by: bag)
//
//        Api.rx.request(.zen)
//        .asObservable()
//        .mapString()
//            .subscribe(onNext: { (s) in
//                print(s)
//            }, onError: { (e) in
//                print(e)
//            }, onCompleted: {
//                print("complete")
//            }, onDisposed: {
//                print("dispose")
//            })
//        .disposed(by: bag)
        
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
		
		Api.rx.request(.userProfile("xxdzyyh")).asObservable().mapString().subscribe(onNext: { (result) in
				print(result)
			}).disposed(by: bag)
    }
}
