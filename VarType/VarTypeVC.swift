//
//  VarType.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/4/1.
//  Copyright © 2019 yunmai. All rights reserved.
//

import Foundation

class VarTypeVC : XFDemoTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = [[ActionKey.value:"dictionary",ActionKey.key:ActionType.Method],
                      [ActionKey.value:"array",ActionKey.key:ActionType.Method]];
        
        loadData(data: dataSource)
    }
    
    @objc func dictionary() {
        var dict:Dictionary<String,String> = Dictionary.init();
        
        // 只有update/remove
        dict.updateValue("value0", forKey: "key0")
        dict.updateValue("value1", forKey: "key1")

        print(dict)

        // dict.remove(at: Dictionary<String,String>.Index)
        dict.removeValue(forKey: "key1")

        print(dict)
    }
    
    @objc func array() {
        var array : Array<String> = Array.init();
        
        array.append("www");
        
        print(array)
    }
}
