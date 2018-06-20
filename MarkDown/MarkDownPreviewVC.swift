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
    
    var contentString : String! = ""
    
    lazy var preview : EFMarkdownView = EFMarkdownView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.preview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

        self.view.addSubview(self.preview)
    }
    
    func loadMarkDownString(markDownString: String) {
        
        self.preview.load(markdown: markDownString)
    }
    
    /**
     *  在原有内容上拼接内容，并重新加载
     */
    func appendMarkDownString(_ markDownString: String) {
        contentString = contentString + markDownString;
        
        loadMarkDownString(markDownString: contentString)
    }
}
