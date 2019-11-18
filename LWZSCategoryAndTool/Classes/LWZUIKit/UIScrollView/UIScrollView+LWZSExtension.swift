//
//  UIScrollView+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/6.
//

import UIKit

extension UIScrollView {
 public var contentOffsetX: CGFloat {
     
     get {
         return self.contentOffset.x
     }
     
     set(newContentOffsetX) {
         self.contentOffset.x = newContentOffsetX
     }
 }
 
 public var contentOffsetY: CGFloat {
     
     get {
         return self.contentOffset.y
     }
     
     set(newContentOffsetY) {
         self.contentOffset.y = newContentOffsetY
     }
 }
 
 public var contentInsetTop: CGFloat {
     
     get {
         return self.contentInset.top
     }
     
     set {
         
         self.contentInset.top = newValue
     }
 }
 
 public var contentInsetBottom: CGFloat {
     
     get {
         return self.contentInset.bottom
     }
     
     set {
         
         self.contentInset.bottom = newValue
     }
 }
 
 public var contentInsetLeft: CGFloat {
     
     get {
         return self.contentInset.left
     }
     
     set {
         
         self.contentInset.left = newValue
     }
 }
 
 public var contentInsetRight: CGFloat {
     
     get {
         return self.contentInset.right
     }
     
     set {
         
         self.contentInset.right = newValue
     }
 }
 
 public var indicatorInsetTop: CGFloat {
     
     get {
         return self.scrollIndicatorInsets.top
     }
     
     set {
         
         self.scrollIndicatorInsets.top = newValue
     }
 }
 
 public var indicatorInsetBottom: CGFloat {
     
     get {
         return self.scrollIndicatorInsets.bottom
     }
     
     set {
         
         self.scrollIndicatorInsets.bottom = newValue
     }
 }
 
 public var indicatorInsetLeft: CGFloat {
     
     get {
         return self.scrollIndicatorInsets.left
     }
     
     set {
         
         self.scrollIndicatorInsets.left = newValue
     }
 }
 
 public var indicatorInsetRight: CGFloat {
     
     get {
         return self.scrollIndicatorInsets.right
     }
     
     set {
         
         self.scrollIndicatorInsets.right = newValue
     }
 }
 
 public var contentSizeWidth: CGFloat {
     
     get {
         return self.contentSize.width
     }
     
     set {
         
         self.contentSize.width = newValue
     }
 }
 
 public var contentSizeHeight: CGFloat {
     
     get {
         return self.contentSize.height
     }
     
     set {
         
         self.contentSize.height = newValue
     }
 }
 
 public func lwzs_stopScrolling() -> Void {
     var contentOffset = self.contentOffset
     contentOffset.x -= 1.0
     contentOffset.y -= 1.0
     self.setContentOffset(contentOffset, animated: false)
     contentOffset.x += 1.0
     contentOffset.y += 1.0
     self.setContentOffset(contentOffset, animated: false)
 }
 
 public func lwzs_isScrollToBottomWithDeviation(deviation: CGFloat) -> Bool {
     let height = self.contentSize.height - deviation
     if height <= 0 {
         return true
     }
     
     let offsetY = self.contentOffsetY
     if (offsetY + self.frame.size.height) >= height {
         return true
     }
     return false
 }
 
 public func lwzs_isScrollToBottom() -> Bool {
     return self.lwzs_isScrollToBottomWithDeviation(deviation: 0)
 }
    

}
