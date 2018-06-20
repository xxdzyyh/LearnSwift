//
//  KeyWordsVC.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2018/6/20.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class KeyWordsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
	
	var tableView: UITableView!
	var dataSource: NSArray!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		dataSource = [["InOutVC","inOut使参数的修改可以保留"]]
		
		setupTableView()
		
		self.view.addSubview(self.tableView!)
		
		self.tableView!.frame = self.view.bounds
	}
	
	///Mark
	func setupTableView() {
		tableView = UITableView.init(frame: CGRect.zero, style: .plain)
		tableView!.delegate = self
		tableView!.dataSource = self
		tableView!.rowHeight = 60
	}
	
	///MARK
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
        
        self.navigationController?.pushViewController(obj as! UIViewController, animated: true)
    }
}
