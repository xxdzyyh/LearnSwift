//
//  GuardVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2018/7/30.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class GuardVC: MarkDownPreviewVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        /**
         * guard能实现的功能，if也可以实现。在某些情况下，guard写法更加简洁。
         */
        
        var name : String? = "name"
        
        if let ifname = name {
            print("if let \(ifname)")
        }
        
        guard var newname = name else {
            print("newname nil")
            return
        }
        
        print("\(newname)")
        
        newname = "this is name"
        
        /**
         * guard/if let 将optional类型自动解包，后续可以使用新的零时变量而无需解包，同时暗含比较的含义
         */
        guard let aname = name else {
            print("guard name nil")
            return
        }
        
        // aname一定有值 
        print(aname)
        
        /**
         * guard true else中的语句将不再执行
         */
        guard true else {
            print("guard true")
            return
        }
        
        /**
         * guard false else中的语句将被执行
         */
        guard false else {
            print("guard false")
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
