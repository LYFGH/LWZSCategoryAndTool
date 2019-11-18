//
//  UIView+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/6.
//

import UIKit

extension UIView {
    
    
    // MARK: ********************** Corner **********************
    
    public func lwzs_cronerRadii(cornerRadius: CGFloat, corners: UIRectCorner = UIRectCorner.allCorners) -> Void {
        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.cgPath;
        self.layer.mask = maskLayer;
    }
    
    // MARK: ********************** BackgroundColor **********************
    
    public func lwzs_gradientColor(startColor: UIColor, endColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) -> Void {
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.addSublayer(gradientLayer)
    }
    
    // MARK:  生成当前view的截图
    public func lwzsShotViewToImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        self.layer.render(in: context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    // MARK: ********************** Frame **********************
    
    public var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    public var right: CGFloat {
        get {
            return self.left + self.width
        }
        set(newRight) {
            self.frame = CGRect(x: newRight - self.width, y: self.top, width: self.width, height: self.height)
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.top + self.height
        }
        
        set(newBottom) {
            self.frame = CGRect(x: self.left, y: newBottom - self.height, width: self.width, height: self.height)
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
    
    
}
