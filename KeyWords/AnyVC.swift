//
//  AnyVC.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2020/6/12.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit

class AnyVC: MarkDownPreviewVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let a : Any = NSObject()
		let b : AnyObject = NSObject()
		
		let flag = b.self is NSObject.Type
		
		if flag {
			print("b is NSObject.Type")
		}
		
		/**
		// Value of type 'MyStruct' does not conform to specified type 'AnyObject'
		let c : AnyObject = MyStruct()
		*/
		
		/**
			// Value of type 'Array<Element>' does not conform to specified type 'AnyObject'
			let d : AnyObject = Array()
		*/
		
		let e : AnyClass = NSObject.self
		
		
		if NSObject.self is AnyClass {
			print("NSObject.self is AnyClass")
		}
		
		do {
			let string = try String.init(contentsOf: Bundle.main.url(forResource: "Any", withExtension: "md")!)
			self.appendMarkDownString(string)
		} catch {
			
		}
    }
}
