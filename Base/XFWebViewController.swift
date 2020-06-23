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
	
	var progressView : UIProgressView!
	var webView : WKWebView!
	var url : String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupWebView()
		setupProgressView();
		
		self.view.addSubview(webView);

		webView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	
		self.view.addSubview(progressView)
		
		self.progressView.snp.makeConstraints { (make) in
			make.top.left.right.equalToSuperview()
		}
	}
	
	func setupWebView() {
		if webView == nil {
			webView = WKWebView.init();
			
			webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
		}
	}
	
	func setupProgressView() {
		if progressView == nil {
			progressView = UIProgressView()
			
			progressView.backgroundColor = UIColor.green
			progressView.progressViewStyle = .bar
			progressView.progressTintColor = UIColor.red
			progressView.trackTintColor = UIColor.gray
			progressView.isHidden = true
		}
	}
	
	func loadURL(_ url: String) {
		
		self.url = url
		
		setupProgressView()
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
	
	/// 进度获取
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		
		if ((keyPath?.elementsEqual("estimatedProgress"))! && webView.isEqual(object)) {
			DispatchQueue.main.async {
				self.progressView.isHidden = false
				self.progressView.progress = Float(self.webView!.estimatedProgress)
				
				print(Float(self.webView!.estimatedProgress))
				
				if self.webView.estimatedProgress >= 1.0 {
					
					UIView.animate(withDuration: 0.3, animations: {
						self.progressView.isHidden = true
					}) { (finished) in
						self.progressView.setProgress(0, animated: false)
					}
					
				}
			}
			
		}
	}
	
}
