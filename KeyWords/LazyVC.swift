//
//  LazyVC.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2020/6/5.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit

class LazyVC: UIViewController {
//
//	init() {
//		super.init()
//		print("LazyVC init")
//	}
	
//	let myTestObject : MyTestObject = MyTestObject()
	
	lazy var myObject = {
		MyObject()
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		
        // Do any additional setup after loading the view.
    }
}


//class MyTestObject : NSObject {
//	init() {
//		print("MyTestObject Init")
//	}
//
//	deinit {
//		print("MyTestObject Deinit")
//	}
//}

