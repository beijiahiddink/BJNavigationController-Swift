//
//  BJNavigationController.swift
//  BJNavigationController-Swift <https://github.com/beijiahiddink/BJNavigationController-Swift>
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

import UIKit

class BJNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //重新设置透明背景的NavigationBar
        let newNavigationBar = BJTranslucentNavigationBar()
        setValue(newNavigationBar, forKey: "navigationBar")
        
        interactivePopGestureRecognizer?.delegate = self
    }
        
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return visibleViewController?.preferredStatusBarStyle() ?? .Default
    }
}

extension BJNavigationController: UIGestureRecognizerDelegate {
    
}


