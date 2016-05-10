//
//  AppDelegate.swift
//  app
//
//  Created by 駿逸 陳 on 2016/5/8.
//  Copyright © 2016年 駿逸 陳. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4
import ParseTwitterUtils
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        // Parse SDK
        // ****************************************************************************
        // Parse initialization
        // FIXME: CrashReporting currently query to cydia://        ParseCrashReporting.enable()
        Parse.setApplicationId("cAUrbKXQ8qfg59UhwAMS8C4H2L4t5hbNlHdI0Qbu", clientKey: "HrV7aLUT9U7DOPFluSejMSOiyB6tFsjGIkJqeQyZ")
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions);
        PFTwitterUtils.initializeWithConsumerKey("SZ58sIVblPZPzoHqinkeJg", consumerSecret: "ANAUJ6cVZIC6HfFBH7IhGfMYu6xmemb9mZx3IGw")
        // TODO: V4      PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        // ****************************************************************************
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        //IQKeyboardManagerSwift
//        IQKeyboardManager.sharedManager().enable = true
        
        if PFUser.currentUser() == nil {
            /* 使用者還沒登入，使用 framework 裡面的 Login storybaord */
            if PFUser.currentUser() == nil {
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                window = UIWindow(frame: UIScreen.mainScreen().bounds)
                window!.rootViewController = storyboard.instantiateInitialViewController()!
                window!.makeKeyAndVisible()
            }
        }
        
        // Track app open.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        if application.applicationIconBadgeNumber != 0 {
            application.applicationIconBadgeNumber = 0
            PFInstallation.currentInstallation().saveInBackground()
        }
        
        let defaultACL: PFACL = PFACL()
        // Enable public read access by default, with any newly created PFObjects belonging to the current user
        defaultACL.publicReadAccess = true
        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser: true)
        
        // Override point for customization after application launch.
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - 返回首頁
    func presentToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = storyboard.instantiateInitialViewController()!
        window!.makeKeyAndVisible()
    }
}

