//
//  KeyWordsVC.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2018/6/20.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class KeyWordsVC: UIViewController {
	
	var tableView: UITableView!
	var dataSource: NSArray!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		dataSource = [["InOutVC","inOut使参数的修改可以保留"],
                      ["GuardVC","Guard"],
                      ["JSONCodableVC","Coable json 转 model"],
                      ["HandyJSONVC","HandyJSON json 转 model"],
					  ["LazyVC","lazy"],
					  ["AnyVC","Any AnyObject AnyClass"],]
		
		setupTableView()
		
		self.view.addSubview(self.tableView!)
		
		self.tableView!.frame = self.view.bounds
	}
	
	/// Mark
	func setupTableView() {
		tableView = UITableView.init(frame: CGRect.zero, style: .plain)
		tableView!.delegate = self
		tableView!.dataSource = self
		tableView!.rowHeight = 60
	}
}

// 利用extension可以将是实现协议的代码分开，便于阅读
extension KeyWordsVC : UITableViewDataSource, UITableViewDelegate {
	/// MARK
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.dataSource.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "Cell");
		
		if cell == nil {
			cell = UITableViewCell.init(style:UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
		}
		
		let item = self.dataSource[indexPath.row] as! NSArray;
		
		cell?.textLabel?.text = item[0] as? String
		cell?.detailTextLabel?.text = item[1] as? String
		
		return cell!
	}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.dataSource[indexPath.row] as! NSArray;
        
        let className = item[0] as! String
        
        let obj = RuntimeHelper.instanceForClassName(className)
        
		if obj != nil {
			self.navigationController?.pushViewController(obj as! UIViewController, animated: true)
		}
    }
}
