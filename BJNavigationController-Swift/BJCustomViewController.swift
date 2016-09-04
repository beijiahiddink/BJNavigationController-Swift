//
//  BJCustomViewController.swift
//  BJNavigationController-Swift <https://github.com/beijiahiddink/BJNavigationController-Swift>
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

import UIKit

public class BJCustomViewController: UIViewController {
    
    public var headerView: UIView?
    
    private lazy var _contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        return view
    }()
    
    //子类添加视图到此View上
    public final var contentView: UIView {
        return _contentView
    }
    
    private var isHeaderViewLoaded = false
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.frame = view.bounds
        //添加子类所需要的内容视图
        view.addSubview(contentView)
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if isHeaderViewLoaded == false {
            headerView?.removeFromSuperview()
            loadHeaderView()
            if let headerView = headerView {
                //确保header视图层级，不然会盖住子类在viewDidLoad时添加到view的视图
                view.insertSubview(headerView, aboveSubview: contentView)
            }
            isHeaderViewLoaded = true
            reloadNavigationItem()
        }
    }
    
    //子类重写需要调用超类
    public override func viewWillLayoutSubviews() {
        contentView.frame = view.bounds
        
        guard let headerView = headerView else { return }
        
        if headerView.isKindOfClass(UINavigationBar.classForCoder()) {
            headerView.frame = CGRect(
                x: 0,
                y: UIApplication.sharedApplication().statusBarFrame.size.height,
                width: view.bounds.width,
                height: navigationController?.navigationBar.bounds.height ?? 0)
        } else {
            headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: headerViewHeight)
        }
    }
}

//MARK: 处理HeaderView的UI和业务逻辑
public extension BJCustomViewController {
    
    public var headerViewHeight: CGFloat {
        return (navigationController?.navigationBar.bounds.height ?? 0) + UIApplication.sharedApplication().statusBarFrame.size.height
    }
    
    //加载Header视图，默认第一次加载会自动调用，子类可以重写，但是不要主动调用，
    //想要重新加载调用setNeedsLoadHeaderView
    public func loadHeaderView() {
        headerView = {
            let view = UINavigationBar()
            view.translucent = false
            return view
        }()
    }
    
    public func setNeedsLoadHeaderView() {
        isHeaderViewLoaded = false
    }
    
    //刷新NavigationItem从而刷新NavBar上面的视图，默认加载HeaderView时会自动调用，子类可根据需要重写
    public func reloadNavigationItem() {
        
    }
    
    public func backButtonAction(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true
        )
    }
}

