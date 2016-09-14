//
//  BJMTHomeViewController.swift
//  BJNavigationController-Swift <https://github.com/beijiahiddink/BJNavigationController-Swift>
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

import UIKit

class BJMTHomeViewController: BJCustomViewController {
    
    var city = "北京"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "eslf_icon_no_suggest_address")
        
        let backgroundView = UIImageView()
        backgroundView.image = image
        backgroundView.center = contentView.center
        backgroundView.bounds.size = image!.size
        contentView.addSubview(backgroundView)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

extension BJMTHomeViewController {
    
    override func loadHeaderView() {
        headerView = {
            let view = BJCustomHeaderView()
            view.backgroundColor = MTThemeColor
            return view
        }()
    }
    
    override func reloadNavigationItem() {
        
        var spaceButtonItem: UIBarButtonItem?
        
        //<---- leftBarButtonItems ---->
        
        if navigationItem.leftBarButtonItems == nil {
            spaceButtonItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            spaceButtonItem?.width = -8
            let locationButtonItem = BJMTBarButtonItem(bj_style: .location, target: self, action: #selector(BJMTHomeViewController.itemAction(_:)))
            navigationItem.leftBarButtonItems = [spaceButtonItem!, locationButtonItem]
        }
        
        if let locationButtonItem = navigationItem.leftBarButtonItems?.last as? BJMTBarButtonItem {
            locationButtonItem.bj_barButton?.setTitle(city, forState: .Normal)
            let locationButtonW = locationButtonItem.customView!.sizeThatFits(CGSizeZero).width
            locationButtonItem.customView?.bounds.size = CGSize(width: locationButtonW, height: 25)
        }
        
        //<---- titleView ---->
        
        if navigationItem.titleView == nil {
            let searchButtonItem = BJMTBarButtonItem(bj_style: .search, target: self, action: #selector(BJMTHomeViewController.itemAction(_:)))
            navigationItem.titleView = searchButtonItem.customView
        }
        
        //<---- rightBarButtonItems ---->
        
        if navigationItem.rightBarButtonItems == nil {
            let messageButtonItem = BJMTBarButtonItem(bj_style: .message, target: self, action: #selector(BJMTHomeViewController.itemAction(_:)))
            let scanButtonItem = BJMTBarButtonItem(bj_style: .scan, target: self, action: #selector(BJMTHomeViewController.itemAction(_:)))
            
            navigationItem.rightBarButtonItems = [spaceButtonItem!, messageButtonItem, scanButtonItem]
        }
    }
    
    func itemAction(sender: BJMTBarButton) {
        let vc = BJMTViewController()
        
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
