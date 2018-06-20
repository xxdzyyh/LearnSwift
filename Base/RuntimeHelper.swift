//
//  RuntimeHelper.swift
//  LearnSwift
//
//  Created by yunmai on 2018/6/20.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class RuntimeHelper: NSObject {
    
    static func instanceForClassName(_ className : String) -> AnyObject {
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cla : AnyClass = NSClassFromString(nameSpace+"."+className)!
        let realClass = cla as! NSObject.Type
        
        let obj = realClass.init();
        
        return obj
    }
    
}
