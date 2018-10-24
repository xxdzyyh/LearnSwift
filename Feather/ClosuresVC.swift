//
//  Closures.swift
//  LearnSwift
//
//  Created by yunmai on 2018/6/21.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class ClosuresVC: MarkDownPreviewVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        originClosures()
        simplePetemeterName()
        
        /*!
         不使用尾随闭包特性
         */
        testTrailingClosuresFunction(a: 4, { (i) in
            return (i + 1)
        })
        
        /*!
         使用尾随闭包特性
         */
        testTrailingClosuresFunction(a: 4) { i in
            return (i - 1)
        }
        
//        func normalFunc(a: Int) {
//            print(a)
//        }
//        
//        normalFunc(a: 4) { i in
//            return (i-1)
//        } // Extra argument 'a' in call
    }
    
    func originClosures() {
        let closures = { (a: Int,b: Int) -> Int in
            return a + b
        }
        
        let result = closures(1,5)
        
        print(result)
    }
    
    func simplePetemeterName() {
        let names = ["AT", "AE", "D", "S", "BE"]
        
        /*!
         如果上下文能够提供足够的信息，那么在声明闭包的时候，可以简化
         */
        let result = names.sorted(by: {$0 < $1})
        
        print(result)
        
//        let closures = {
//            $0 > $1
//        }
    }
    
    /*!
     尾随闭包，如果闭包作为函数的最后一个参数，那在调用的时候，可以将闭包放在参数后面
     */
    func testTrailingClosuresFunction(a:Int, _ closures: (Int) -> Int) {
        print(closures(a))
    }
}
