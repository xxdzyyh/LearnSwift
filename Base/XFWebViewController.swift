//
//  XFWebViewController.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2018/6/20.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class XFWebViewController : UIViewController {
	
	var webView : WKWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupWebView()
		self.view.addSubview(webView);
		
		webView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
	
	func setupWebView() {
		if webView == nil {
			webView = WKWebView.init();
		}
	}
	
	func loadURL(_ url: String) {
		
		setupWebView()
		
		if url.isEmpty {
			print("XFWebViewController url isEmpty")
			return
		}
		
		let realURL = URL.init(string: url)
	
		if realURL == nil {
			print("XFWebViewController URL from String #{url} is nil");
			return
		}
		
		let request = URLRequest(url: realURL!)
		
		webView.load(request)
	}
}
