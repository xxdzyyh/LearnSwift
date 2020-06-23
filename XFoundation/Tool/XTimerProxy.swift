//
//  TimerProxy.swift
//  SPARKVIDEO
//
//  Created by sckj on 2020/6/22.
//

/**
 ViewController.swift
 
 weak var timer : Timer?

 func startTimer() {
     if self.timer == nil {
         let timerProxy = XTimerProxy()
         timerProxy.delegate = self
         let timer = Timer(timeInterval: 1, target: timerProxy, selector: NSSelectorFromString("timerAction"), userInfo: nil, repeats: true)
         RunLoop.current.add(timer, forMode: .common)
         self.timer = timer
     }
     self.timer?.fire()
 }
 
 强引用关系如下
 
 RunLoop  -------------> Timer ------------------> timerProxy
 
 只要将Timer移出RunLoop就可以都释放
 
 */
import UIKit

@objc protocol XTimerProxyDelegate {
    @objc func timerAction()
}

class XTimerProxy : NSObject,XTimerProxyDelegate {
    weak var delegate : XTimerProxyDelegate?
    
    @objc public func timerAction() {
        if self.delegate != nil {
            self.delegate?.timerAction()
        }
    }
}
