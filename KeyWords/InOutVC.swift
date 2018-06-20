//
//  InOutVC.swift
//  LearnSwift
//
//  Created by yunmai on 2018/6/20.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class InOutVC: MarkDownPreviewVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        appendMarkDownString("* 值传递 传递的是参数的一个副本，这样在调用参数的过程中不会影响原始数据\n\n ")
        appendMarkDownString("  ```func withOutInOut(_ a: Int) { print(a) }```\n\n")
        appendMarkDownString("  ``` withOutInOut(a)```\n\n")
        appendMarkDownString("* 引用传递 把参数本身引用(内存地址)传递过去，在调用的过程会影响原始数据，swift中Class默认是引用类型，其他都是值类型 \n\n")
        appendMarkDownString("* 如果希望值传递类型变成引用传递，可以使用inout \n\n")
        appendMarkDownString("  ``` func withInOut(_ a: inout Int) {  a = 100 }``` \n\n")
        appendMarkDownString("  ``` withInOut(&a)```\n\n")
        
        var a = 10
        
        withOutInOut(a)
        
        print(a)
        
        withInOut(&a)
        
        print(a)
    }
    
    func withOutInOut(_ a: Int) {
      /// Cannot assign to value : 'a' is a 'let' constant
      /// a = 100;
        print(a)
    }
    
    func withInOut(_ a: inout Int) {
        a = 100
    }
}
