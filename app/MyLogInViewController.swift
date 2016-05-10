//
//  MyLogInViewController.swift
//  app
//
//  Created by 駿逸 陳 on 2016/5/9.
//  Copyright © 2016年 駿逸 陳. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MyLogInViewController: PFLogInViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGrayColor()
        // Do any additional setup after loading the view.
        let logo = UIImageView()
        logo.image = UIImage(named: "spotify_logo")
        logo.sizeToFit()
        logInView?.logo = logo
        
        logInView?.dismissButton?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
