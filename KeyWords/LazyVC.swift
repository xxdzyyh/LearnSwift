//
//  LazyVC.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2020/6/5.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit

class LazyVC: UIViewController {
	
	// 在 LazyVC init 时，myTestObject就会被创建
	let myTestObject : MyTestObject = MyTestObject()
	
	// 第一次调用就会才会被创建
	lazy var myObject = {
		MyObject()
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		print("viewDidLoad")
		print(myObject)
        // Do any additional setup after loading the view.
    }
}


class MyTestObject : NSObject {
	override init() {
		
		/**
		  LearnSwift`MyTestObject.init() at LazyVC.swift:30:9
		  LearnSwift`@objc MyTestObject.init() at <compiler-generated>:0
		  LearnSwift`MyTestObject.__allocating_init() at LazyVC.swift:0
		  LearnSwift`LazyVC.init(nibNameOrNil=nil, nibBundleOrNil=nil) at LazyVC.swift:13:36
		*/
		print("MyTestObject Init")
	}

	deinit {
		print("MyTestObject Deinit")
	}
}

