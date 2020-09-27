//
//  DeferVC.swift
//  LearnSwift
//
//  Created by sckj on 2020/8/29.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit

class DeferVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    /**
        defer 后面更的block 会在当前scope结束时调用，成对出现的代码可以使用defer写到一起
     */
    func deferTest() {
        defer {
            self.unlock()
        }
        
        self.lock()
        print("2")
        
        defer {
            self.tableView.endUpdates()
        }
        self.tableView.beginUpdates()
        
        // update ...
    }
    
    func lock() {
        print("lock")
    }
    
    func unlock() {
        print("unlock")
    }
    
    lazy var tableView : UITableView = UITableView()
}
