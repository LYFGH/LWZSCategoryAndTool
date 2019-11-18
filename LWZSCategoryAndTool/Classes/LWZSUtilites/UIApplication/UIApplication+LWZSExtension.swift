//
//  UIApplication+LWZSExtension.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/7.
//

import Foundation

extension UIApplication {
    
    public func lwzs_openAppStoreReviews(appId: String) -> Void {
        let url = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=\(appId)"
        self.openURL(URL(string: url)!)
    }
    
    public func lwzs_openAppStore(appId: String) -> Void {
        let url = "https://itunes.apple.com/cn/app/id\(appId)?mt=8"
        self.openURL(URL(string: url)!)
    }
    
    public func lwzs_allowedNotification() -> Bool {
//        let setting = self.currentUserNotificationSettings
//        return (setting.types == UIUserNotificationType.none) ? false : true
        return false
    }
    
    public func lwzs_tel(to telNumber: String) -> Void {
        let url = "telprompt://\(telNumber)"
        self.openURL(URL(string: url)!)
    }
    
    
    
}
