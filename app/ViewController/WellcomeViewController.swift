//
//  WellcomeViewController.swift
//  app
//
//  Created by 駿逸 陳 on 2016/5/8.
//  Copyright © 2016年 駿逸 陳. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import VideoBackgroundViewController

class WellcomeViewController: VideoBackgroundViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("spotifyVideo", ofType: "mp4")!)
        
        self.videoURL = url
    }
    
    override func viewDidAppear(animated: Bool) {
//        if PFUser.currentUser() == nil {
//            let logInViewController = CustomLoginViewController()
//            logInViewController.delegate = self
//            logInViewController.fields = [.UsernameAndPassword, .PasswordForgotten, .LogInButton, .Facebook, .Twitter, .SignUpButton, .DismissButton]
//            if let signUpController = logInViewController.signUpController {
//                signUpController.delegate = self
//                signUpController.fields = [.UsernameAndPassword, .Email, .Additional, .SignUpButton, .DismissButton]
//            }
//            presentViewController(logInViewController, animated: true, completion: nil)
//        }
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
