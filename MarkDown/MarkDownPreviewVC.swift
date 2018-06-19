//
//  MarkDownPreviewVC.swift
//  LearnSwift
//
//  Created by yunmai on 2018/6/19.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import Foundation
import UIKit
import EFMarkdown

class MarkDownPreviewVC: UIViewController {
    
    lazy var preview : EFMarkdownView = EFMarkdownView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.preview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        self.preview.load(markdown: "### Swift中的惰性初始化 \n Swift中，有两种方式来惰性初始化。 \n\n 第一种，简单表达式 \n\n ``` lazy var first = NSArray(objects: \"1\",\"2\") ``` \n\n 第二种，闭包 \n\n ```lazy var second:String = { return \"second\" }()```", options:EFMarkdownOptions.githubPreLang, completionHandler: { [weak self]  (_,_) in
            // Optional: you can change font-size with a value of percent here
            self!.preview.setFontSize(percent: 128)
            printLog("load finish!")
        })
        
        self.preview.onRendered = {
            [weak self] (height) in
            if let _ = self {
                // Optional: you can know the change of height in this block
                print("onRendered height: \(height ?? 0)")
            }
        }
        
        self.view.addSubview(self.preview)
    }
}
