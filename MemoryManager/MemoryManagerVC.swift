//
//  MemoryManagerVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/5/30.
//  Copyright © 2019 yunmai. All rights reserved.
//

import UIKit

class MyObject {
    
    var name = ""
    
    init() {
        print("MyObject init")
    }
    
    deinit {
        print("MyObject deinit")
    }
}

struct MyStruct {
    var name = ""
    
    init() {
        
    }
}


class MemoryManagerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let obj = MyObject()
        
        obj.name = "www"
        
        debugPrint(obj)
    }

}
