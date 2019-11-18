//
//  Macro.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/7.
//

import Foundation

// MARK: UI 相关
public let kLWZSScreenWidth = UIScreen.main.bounds.size.width
public let kLWZSScreenHeight = UIScreen.main.bounds.size.height

public func kLWZSScreenAutoLayoutScaleCeil(_ x: Double) -> CGFloat {
    let scale = kLWZSScreenWidth / 375.0
    return CGFloat(ceil(Double(scale) * x))
}

public let kLWZSStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
public let kLWZSNavigationBarHeight = CGFloat(44.0)
public let kLWZSNavigationAndStatusBarHeight = (kLWZSStatusBarHeight+kLWZSNavigationBarHeight)

public var kLWZSScreenSafeBottomHeight: CGFloat {
    var bottom = CGFloat(0.0)
    if #available(iOS 11.0, *) {
        bottom = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)!
    }
    return bottom;
}

public let kLWZSTabBarHeight = (kLWZSScreenSafeBottomHeight + 49.0)


// MARK: 版本号相关
public let kLWZSClientVersion: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
public let kLWZSCurrentSystemVersion = UIDevice.current.systemVersion

public func kLWZSClassType(_ className: String) -> AnyClass {
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
    let cls: AnyClass = NSClassFromString(namespace + "." + className)!
    return cls
}
