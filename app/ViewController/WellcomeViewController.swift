//
//  WellcomeViewController.swift
//  app
//
//  Created by 駿逸 陳 on 2016/5/8.
//  Copyright © 2016年 駿逸 陳. All rights reserved.
//

import UIKit
import VideoBackgroundViewController
import Parse
import ParseUI

class WellcomeViewController: VideoBackgroundViewController {

    var i = false
    var timer = NSTimer()
    private var _presentedLoginViewController: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        setVideo()
        timer = NSTimer.scheduledTimerWithTimeInterval(8, target: self, selector: #selector(WellcomeViewController.setVideo), userInfo: nil, repeats: true)
    }
    
    func setVideo()
    {
        var url:NSURL
        if i == false {
            url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("cat", ofType: "mp4")!)
            i = true
        } else {
            url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("dog", ofType: "mp4")!)
            i = false
        }
        self.videoURL = url
    }
    
    override func viewWillDisappear(animated: Bool) {
        timer.invalidate()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        let logInViewController = MyLogInViewController()
        logInViewController.delegate = self
        logInViewController.fields = [.UsernameAndPassword, .PasswordForgotten, .LogInButton, .Facebook, .Twitter, .SignUpButton, .DismissButton]
        if let signUpController = logInViewController.signUpController {
            signUpController.delegate = self
            signUpController.fields = [.UsernameAndPassword, .Email, .Additional, .SignUpButton, .DismissButton]
        }
        presentViewController(logInViewController, animated: true, completion: nil)
    }

    @IBAction func signupButtonPressed(sender: AnyObject) {
        let signUpController = MySignUpViewController()
        signUpController.delegate = self
        signUpController.fields = [.UsernameAndPassword, .Email, .Additional, .SignUpButton, .DismissButton]
        presentViewController(signUpController, animated: true, completion: nil)
    }
    
    // MARK: - Login Delegate
    
    func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController) {
        
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        
    }
    
    // MARK: - Signup Delegate
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        
    }
    
    // MARK:- PAPWelcomeViewController
    
    func presentLoginViewController(animated: Bool) {
        if _presentedLoginViewController {
            return
        }
        
        _presentedLoginViewController = true
        let loginViewController = MyLogInViewController()
        loginViewController.delegate = self
        presentViewController(loginViewController, animated: animated, completion: nil)
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


extension WellcomeViewController : PFLogInViewControllerDelegate {
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        //轉場至首頁
        (UIApplication.sharedApplication().delegate as! AppDelegate).presentToHome()
    }
    
}

extension WellcomeViewController : PFSignUpViewControllerDelegate {
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        //註冊成功，轉場至首頁
        (UIApplication.sharedApplication().delegate as! AppDelegate).presentToHome()
    }
    
}
