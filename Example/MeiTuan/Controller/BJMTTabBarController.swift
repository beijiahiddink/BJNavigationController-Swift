//
//  BJMTTabBarController.swift
//  BJNavigationController-Swift <https://github.com/beijiahiddink/BJNavigationController-Swift>
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

import UIKit

class BJMTTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = MTThemeColor
    }
        
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return selectedViewController?.preferredStatusBarStyle() ?? .Default
    }
}