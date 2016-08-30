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
        
        let rootViewController = UIStoryboard(name: "BJMTMainInterface", bundle: nil)
            .instantiateInitialViewController()
        
        window = {
            let window = UIWindow()
            window.backgroundColor = UIColor.whiteColor()
            window.rootViewController = rootViewController
            return window
        }()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

