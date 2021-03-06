//
//  MasterViewController.swift
//  LearnSwift
//
//  Created by yunmai on 2018/6/19.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Array<Any>]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		self.view.backgroundColor = .orange
		self.tableView.backgroundColor = .red
	
        objects = [
                   ["RxSwiftVC","枚举"],
                   ["EnumVC","枚举"],
                   ["CircleProgressVC","圆形进度"],
                   ["AudioVC","音频"],
				   ["MemoryManagerVC","内存管理"],
                   ["KeyWordsVC","swift关键字"],
				   ["访问控制","http://www.runoob.com/swift/swift-access-control.html"],
                   ["FeathersVC","swift语言特性"],
				   ["AppleDemo","苹果官方Demo"],
                   ["VarTypeVC","数据类型"],
                   ["MoyaDemoVC","MoyaDemoVC"],
                   ["SnapKitDemoVC","SnapKitDemo"],
                   ["CartographyVC","CartographyDemo"],
        ];
        
    }
	
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object : Array = objects[indexPath.row]
        let className : String = object[0] as! String;
        
        cell.textLabel!.text = className
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object : Array = objects[indexPath.row]
        
        let className : String = object[0] as! String;
        
        if className.hasSuffix("VC") {
			
			let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
			let cla : AnyClass = NSClassFromString(nameSpace+"."+className)!
			let realClass = cla as! UIViewController.Type
			
			let vc = realClass.init();
			
			self.navigationController?.pushViewController(vc, animated: true)
		} else if (className.elementsEqual("访问控制")) {
			
			let webviewVC = XFWebViewController();
			
			webviewVC.loadURL("http://www.runoob.com/swift/swift-access-control.html")
			
			self.navigationController?.pushViewController(webviewVC, animated: true);
		} else if (className.elementsEqual("AppleDemo")) {
			
			let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
			let cla : AnyClass = NSClassFromString(nameSpace+"."+className)!
			let realClass = cla as! UIViewController.Type
			
			let vc = realClass.init();
			
			self.navigationController?.pushViewController(vc, animated: true)
		}
    }
}

