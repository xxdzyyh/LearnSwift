//
//  RxSwiftDemoVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/4/8.
//  Copyright © 2019 yunmai. All rights reserved.
//

import UIKit
import RxSwift

class RxSwiftDemoVC : XFDemoTableViewController {
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = [
                        ["className":"just","desc":"never","type":"method"],
                    ]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.dataSource[indexPath.row] as! NSDictionary;
        let type = item["type"] as! String
        
        if type == "method" {
            self.perform(Selector.init(item.value(forKey:"className") as! String))
        }
    }
    
    @objc func just() {
        Observable.just("oo").subscribe(onNext: { (s) in
            print(s)
        }, onCompleted: { 
            print("complete")
        }) { 
            print("dispose")
        }.disposed(by: bag)
    }
    
}
