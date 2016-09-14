//
//  AppDelegate.swift
//  BJNavigationController-Swift
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        NSThread.sleepForTimeInterval(1.0)
        
        let config = BJConfig()
        let rootViewController = config.rootViewController()
        
        window = {
            let window = UIWindow()
            window.backgroundColor = UIColor.whiteColor()
            window.makeKeyAndVisible()
            return window
        }()
        
        window?.rootViewController = rootViewController
        
        
        return true
    }
}

