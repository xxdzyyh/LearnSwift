//
//  PropertyDemoVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/4/8.
//  Copyright © 2019 yunmai. All rights reserved.
//

import UIKit

class PropertyDemoVC : UIViewController {
    
    // 完整的形式
    var name : String = { (arg1 : String) in
        return arg1
    } ("日月当空")
    
    // 没有参数名，in 也可以省略
    // 
    var name1 : String = {
        return $0
    } ("龙战在野")

    // 最后面的 () 代表传入的参数
    var name2 : String = {
        return "邪帝龙鹰"
    }()
    
    // 省略 () 的同时，= 也不能写
    var name3 : String {
        return "邪帝龙鹰"
    }
    
    // 如果只有一行代码，return 也可以省略
    var name4 : String = {
        "邪帝龙鹰"
    }()
    
    // 延迟存储
    lazy var name6 = "www"
    
    // 延迟计算
    lazy var name7: String = {
        return "人雅"
    }()
}
