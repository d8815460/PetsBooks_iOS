//
//  CustomLoginViewController.swift
//  app
//
//  Created by 駿逸 陳 on 2016/5/8.
//  Copyright © 2016年 駿逸 陳. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class CustomLoginViewController: PFLogInViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label = UILabel()
        label.textColor = UIColor.whiteColor()
        label.text = "Pets Book"
        label.sizeToFit()
        logInView?.logo = label
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
