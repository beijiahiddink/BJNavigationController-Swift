//
//  BJMTBarButton.swift
//  BJNavigationController-Swift <https://github.com/beijiahiddink/BJNavigationController-Swift>
//
//  Created by 王旭 on 16/8/29.
//  Copyright © 2016年 beijiahiddink. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

import UIKit

class BJMTBarButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        adjustsImageWhenHighlighted = false
        load()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BJMTBarButton {
    
    func load() {
        
    }
    
    //计算文本size
    func sizeForText() -> CGSize {
        guard let text = titleLabel?.text else { return CGSizeZero }

        let size = text.sizeWithAttributes([NSFontAttributeName: titleLabel!.font])
        
        return size
    }
}

class BJMTLocationBarButton: BJMTBarButton {
    
    override func load() {
        tintColor = UIColor.whiteColor()
        titleLabel?.font = barTitleFont
        
        let image = UIImage(named: "icon_city_districts_expand")?.imageWithRenderingMode(.AlwaysTemplate)
        setImage(image, forState: .Normal)
    }
    
    //计算最大宽度
    override func sizeThatFits(size: CGSize) -> CGSize {
        let titleW = sizeForText().width
        let imageW: CGFloat = 9
        
        let sizeW = 10 + titleW + imageW
        
        return CGSize(width: sizeW, height: 0)
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        if contentRect == CGRectZero {
            return CGRectZero
        }
        
        let imageX = contentRect.width - 14
        let imageY = contentRect.midY - 2
        
        return CGRect(x: imageX, y: imageY, width: 9, height: 5)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        if contentRect == CGRectZero {
            return CGRectZero
        }
        
        let imageRect = imageRectForContentRect(bounds)
        let titleW = contentRect.width - imageRect.width
        
        return CGRect(x: 0, y: 0, width: titleW, height: contentRect.height)
    }
}

class BJMTSearchBarButton: BJMTBarButton {
    
    override func load() {
        backgroundColor = UIColor.whiteColor()
        let image = UIImage(named: "icon_navigationItem_search")
        
        setImage(image, forState: .Normal)
        setTitle("输入商家、品类、商圈", forState: .Normal)
        setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        titleLabel?.font = barTitleFont
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.midY
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x: 8, y: contentRect.midY - 7, width: 14, height: 14)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageRect = imageRectForContentRect(contentRect)
        let titleX = imageRect.maxX + 5
        
        return CGRect(x: titleX, y: 0, width: contentRect.width - titleX, height: contentRect.height)
    }
}

class BJMTBackBarButton: BJMTBarButton {
    
    override func load() {
        let image = UIImage(named: "icon_navigationItem_back")?.imageWithRenderingMode(.AlwaysTemplate)
        
        setImage(image, forState: .Normal)
        setTitle("返回", forState: .Normal)
        setTitleColor(MTThemeColor, forState: .Normal)
        titleLabel?.font = barTitleFont
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: contentRect.midY - 10, width: 22, height: 22)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageRect = imageRectForContentRect(contentRect)
        let titleX = imageRect.maxX - 3
        
        return CGRect(x: titleX, y: 1, width: contentRect.width - titleX, height: contentRect.height)
    }
}
