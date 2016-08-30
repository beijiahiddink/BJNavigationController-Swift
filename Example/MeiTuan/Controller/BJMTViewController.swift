//
//  BJMTViewController.swift
//  BJNavigationController-Swift <https://github.com/beijiahiddink/BJNavigationController-Swift>
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

import UIKit

class BJMTViewController: BJCustomViewController {
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "你好，美团"
        
        let image = UIImage(named: "eslf_icon_no_suggest_address")
        
        let backgroundView = UIImageView()
        backgroundView.image = image
        backgroundView.center = contentView.center
        backgroundView.bounds.size = image!.size
        contentView.addSubview(backgroundView)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }
}

extension BJMTViewController {
    
    override func reloadNavigationItem() {
        
        navigationController?.navigationBar.tintColor = MTThemeColor
        
        let spaceButtonItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        spaceButtonItem.width = -8
        
        let backButtonItem = BJMTBarButtonItem(bj_style: .back, target: self, action: Selector("backButtonAction:"))
        
        navigationItem.leftBarButtonItems = [spaceButtonItem, backButtonItem]
    }
}

