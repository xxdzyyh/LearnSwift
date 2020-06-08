//
//  AudioRecordVC.swift
//  LearnSwift
//
//  Created by wangxuefeng on 2020/6/5.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit

import AVFoundation

class AudioRecordVC: UIViewController {
	
	var recoder : AVAudioRecorder?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let startButton = UIButton.init(type: UIButtonType.custom)
		
		startButton.setTitle("开始录制", for: UIControlState.normal)
		startButton.frame = CGRect(x: 30, y: 100, width: 80, height: 20)
		startButton.addTarget(self, action: Selector.init(("startButton")), for: UIControlEvents.touchUpInside)
		
		self.view.addSubview(startButton)
		
		let stopButton = UIButton.init(type: UIButtonType.custom)
		
		stopButton.setTitle("开始录制", for: UIControlState.normal)
		stopButton.frame = CGRect(x: 200, y: 100, width: 80, height: 20)
		stopButton.addTarget(self, action: Selector.init(("endButton")), for: UIControlEvents.touchUpInside)
		
		self.view.addSubview(stopButton)
    }
    
	@objc func startButton() {
		case1()
	}
	
	@objc func endButton() {
		if self.recoder != nil {
			if self.recoder?.isRecording == true {
				self.recoder?.stop()
				self.recoder?.delegate = nil
				self.recoder = nil
			}
		}
	}

	/**
	
	*/
	func case1() {
		let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
		let filePath = documentPath.appending("/myfile");
		
		FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
		
		let url = URL.init(fileURLWithPath: filePath)
		
		do {
			let recorder = try AVAudioRecorder.init(url: url, settings: [AVFormatIDKey:kAudioFormatLinearPCM,
																	  AVSampleRateKey:16000,
																	  AVNumberOfChannelsKey:2,
																	  AVLinearPCMBitDepthKey:16,
																	  AVEncoderAudioQualityKey:AVAudioQuality.high])
			
			recorder.isMeteringEnabled = true
			recorder.delegate = self
			
			self.recoder = recorder
			
			if self.recoder != nil {
				do {
					try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
					try AVAudioSession.sharedInstance().setActive(true)
				} catch {
					
				}
				
				if self.recoder?.prepareToRecord() == true {
					self.recoder?.record()
				}
				
			}
			
		} catch let e as NSError {
			print(e)
		}
	}
}

extension AudioRecordVC : AVAudioRecorderDelegate {
	
	func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
		print(flag)
	}
	
	func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
	
	}
}
