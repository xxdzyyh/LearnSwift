//
//  XFDemoTableViewController.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2018/6/26.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

/*！
	XFDemoTableViewController接收特定数据格式的dataSoure,进行默认的展示和处理

	dataSource结构

	[
		[
			"className" : "this is className",
		 	"desc" : "this is type",
		 	"type" : "this is type"
		]
	]
*/
class XFDemoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	var tableView : UITableView!
	var dataSource: NSArray! {
		set(data) {
			
		}
		get {
			return
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		dataSource = [];
		
		setupTableView()
		self.view.addSubview(self.tableView!)
		self.tableView.frame = self.view.bounds
	}
	
	func setupTableView() {
		tableView = UITableView(frame: CGRect.zero, style: .plain)
		
		tableView.delegate = self;
		tableView.dataSource = self;
		tableView.rowHeight = 60
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
		let item = self.dataSource[indexPath.row] as! NSDictionary;
		
		let className = item["className"] as! String
		let type = item["type"] as! String
		
		switch type {
		case "ViewController":
			
			let obj = RuntimeHelper.instanceForClassName(className)
			
			self.navigationController?.pushViewController(obj as! UIViewController, animated: true)
			
		default:
			print("cannot deal with type #{}")
		}

		
	}
	
	
	
}
