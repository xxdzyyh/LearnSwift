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
        
        testTrailingClosuresFunction(a: 4, { (i) in
            return (i + 1)
        })
        
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
        
        let result = names.sorted(by: {$0 < $1})
        
        print(result)
        
//        let closures = {
//            $0 > $1
//        }
    }
    
    func testTrailingClosuresFunction(a:Int, _ closures: (Int) -> Int) {
        print(closures(a))
    }
}
