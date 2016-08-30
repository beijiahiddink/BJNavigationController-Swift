//
//  BJNavigationBar.swift
//  BJNavigationController-Swift <https://github.com/beijiahiddink/BJNavigationController-Swift>
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

import UIKit

class BJNavigationBar: UINavigationBar {
    
    private weak var _barBackgroundView: UIView?
    
    //拦截背景视图
    var barBackgroundView: UIView? {
        if _barBackgroundView == nil {
            for view in subviews {
                let className = "\(view.classForCoder)"
                if className == "_UINavigationBarBackground" {
                    _barBackgroundView = view
                    break
                }
            }
        }
        
        return _barBackgroundView
    }
}

//MARK: 隐藏背景的NavigationBar
class BJTranslucentNavigationBar: BJNavigationBar {
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        if newSuperview != nil {
            //隐藏navigationBar背景视图
            barBackgroundView?.hidden = true
        }
    }
}

//MARK: NavigationBar的背景视图
class BJCustomHeaderView: UIView {
    
    var imageView: UIImageView?
    
    override internal func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = bounds
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        if newSuperview == nil {
            imageView?.removeFromSuperview()
            imageView = nil
        }
    }
}

extension BJCustomHeaderView {
    
    func bj_setBackgroundImage(image: UIImage) {
        defer {
            setNeedsLayout()
        }
        
        if imageView == nil {
            imageView = UIImageView()
            imageView?.clipsToBounds = true
            addSubview(imageView!)
        }
        backgroundColor = UIColor.whiteColor()
        imageView?.hidden = false
        imageView?.image = image
    }
    
    func bj_setBackgroundColor(color: UIColor) {
        if imageView != nil {
            imageView?.hidden = true
        }
        backgroundColor = color
    }
}

