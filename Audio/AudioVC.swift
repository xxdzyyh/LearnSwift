//
//  AudioVC.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2020/6/5.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit

class AudioVC: UIViewController {

	var dataSource = ["录音功能实现"]
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.addSubview(self.tableView)
		self.tableView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
    }
	
	lazy var tableView = { () -> UITableView in
		let tableView = UITableView.init(frame: .zero, style: UITableViewStyle.plain)
		
		tableView.delegate = self
		tableView.dataSource = self
		
		return tableView
	}()
}

extension AudioVC : UITableViewDelegate,UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "AudioVC")
		if cell == nil {
			cell = UITableViewCell.init(style: .default, reuseIdentifier: "AudioVC")
		}
		
		cell!.textLabel?.text = self.dataSource[indexPath.row]
		
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = AudioRecordVC.init()
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
}
