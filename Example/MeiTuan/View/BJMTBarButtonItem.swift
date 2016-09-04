//
//  BJMTBarButtonItem.swift
//  BJNavigationController-Swift <https://github.com/beijiahiddink/BJNavigationController-Swift>
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

import UIKit

enum BJMTBarButtonItemStyle: Int {
    case back
    case location
    case search
    case scan
    case message
}

class BJMTBarButtonItem: UIBarButtonItem {
    
    var bj_style: BJMTBarButtonItemStyle
    
    var bj_barButton: BJMTBarButton? {
        return customView as? BJMTBarButton
    }
    
    init(bj_style: BJMTBarButtonItemStyle, target: AnyObject?, action: Selector) {
        self.bj_style = bj_style
        super.init()
        
        switch bj_style {
        case .back:
            let button = BJMTBackBarButton()
            button.bounds.size = CGSize(width: 50, height: 25)
            customView = button
            
        case .location:
            let button = BJMTLocationBarButton()
            customView = button
            
        case .search:
            let button = BJMTSearchBarButton()
            button.bounds.size = CGSize(width: 195, height: 26)
            customView = button
            
        case .scan:
            let button = BJMTBarButton()
            button.bounds.size = CGSize(width: 25, height: 25)
            button.setImage(UIImage(named: "icon_navigationItem_scan_white"), forState: .Normal)
            customView = button
            
        case .message:
            let button = BJMTBarButton()
            button.bounds.size = CGSize(width: 25, height: 25)
            button.setImage(UIImage(named: "icon_navigationItem_message_white"), forState: .Normal)
            customView = button
            
        }
        
        if let barButton = customView as? BJMTBarButton {
            barButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

