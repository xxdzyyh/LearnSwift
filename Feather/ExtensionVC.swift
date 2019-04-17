//
//  ExtensionVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/4/8.
//  Copyright © 2019 yunmai. All rights reserved.
//

import UIKit

protocol MyProtocol {
    func test();
}

class ExtensionVC : UIViewController {
    // 设置为private,extentsion中照样可以访问，因为extension和主类实际是一个类
    private lazy var name = "邪帝龙鹰"
    
    // 同一文件可以访问
    fileprivate lazy var age = 19
    
    // 模块内部可以访问
    internal lazy var height = 180
    
    // 可以被任何人访问，但是其他module中不可以集成和重写
    public lazy var weight = 70
    
    // 最高权限，可以被任何module和文件访问和继承重写
    open lazy var head = 11
    
}

class CustomVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let extensionVC = ExtensionVC()
        
        print(extensionVC.age)
        
        // 'name' is inaccessible due to 'private' protection level
        // print(extensionVC.name)
    }
    
}


extension ExtensionVC : MyProtocol {

    func test() {
        print(self.name)
    }
}

