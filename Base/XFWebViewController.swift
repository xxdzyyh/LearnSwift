//
//  XFWebViewController.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2018/6/20.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit
import WebKit

class XFWebViewController : UIViewController {
	
	var webView : WKWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupWebView()
		self.view.addSubview(webView);
	}
	
	func setupWebView() {
		webView = WKWebView.init();
	
	}
	
	func loadURL(_ url: String) {
		if url.isEmpty {
			print("XFWebViewController url isEmpty")
			return
		}
		
		let realURL = URL.init(string: url)
	
		if realURL == nil {
			print("XFWebViewController URL from String #{url} is nil");
			return
		}
		
		webView.load(URLRequest.init(url: realURL!))
	}
}
