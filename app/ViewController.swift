//
//  ViewController.swift
//  app
//
//  Created by 駿逸 陳 on 2016/5/8.
//  Copyright © 2016年 駿逸 陳. All rights reserved.
//

import UIKit
import VideoBackgroundViewController

class ViewController: VideoBackgroundViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVideo()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setVideo()
    {
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("cat", ofType: "mp4")!)
        
        self.videoURL = url
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
}

