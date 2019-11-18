//
//  NotificationCenter+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/7.
//

import Foundation

extension NotificationCenter {
    
    public func lwzs_safeAddObserver(observer: Any, selector: Selector, name: Notification.Name, object: Any?) -> Void {
        self.removeObserver(observer, name: name, object: object)
        self.addObserver(observer, selector: selector, name: name, object: object)
    }
    
}
