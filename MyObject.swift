//
//  MyObject.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2020/6/5.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit

class MyObject: NSObject {
	override init() {
		print("MyObject Init")
	}
	
	deinit {
		print("MyObject Deinit")
	}
}
